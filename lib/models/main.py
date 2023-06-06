import sqlite3
from typing import Union
from fastapi import FastAPI, Request, Response

app = FastAPI()

@app.get("/init/")
def init_db():
    try:
        DB_NAME = "m2m.db"
        con = sqlite3.connect(DB_NAME)
        cur = con.cursor()
        create_table_user = """ CREATE TABLE user(
            ID_USER INTEGER PRIMARY KEY AUTOINCREMENT,
            email TEXT NOT NULL,
            password TEXT NOT NULL,
            no_telp TEXT NOT NULL,
            foto_profil TEXT NOT NULL,
            saldo INTEGER,
            tipe_user TEXT NOT NULL,
            id_tipe_user INTEGER
        )"""
        create_table_umkm = """CREATE TABLE umkm(
            ID_BORROWER INTEGER PRIMARY KEY AUTOINCREMENT,
            nama_umkm TEXT NOT NULL,
            alamat_umkm_provinsi TEXT NOT NULL,
            alamat_umkm_detail TEXT NOT NULL,
            jenis_usaha TEXT NOT NULL,
            tahun_berdiri TEXT NOT NULL,
            surat_izin_usaha TEXT NOT NULL,
            npwp TEXT NOT NULL,
            laporan_keuangan TEXT NOT NULL,
            foto_umkm TEXT NOT NULL,
            rating TEXT NOT NULL,
            omzet INTEGER,
            deskripsi_umkm TEXT NOT NULL,
            id_pemilik_umkm INTEGER,
            FOREIGN KEY (id_pemilik_umkm) REFERENCES pemilik_umkm(ID_PEMILIK)
        )"""
        create_table_pemilik_umkm = """CREATE TABLE pemilik_umkm(
            ID_PEMILIK INTEGER PRIMARY KEY AUTOINCREMENT,
            nama_lengkap TEXT NOT NULL,
            tg_lahir TEXT NOT NULL,
            jenis_kelamin TEXT NOT NULL,
            nik TEXT NOT NULL,
            foto_ktp TEXT NOT NULL,
            foto_pemilik TEXT NOT NULL
        )"""
        create_table_investor = """CREATE TABLE profil_investor(
            ID_INVESTOR INTEGER PRIMARY KEY AUTOINCREMENT,
            nama_lengkap TEXT NOT NULL,
            tg_lahir TEXT NOT NULL,
            jenis_kelamin TEXT NOT NULL,
            nik TEXT NOT NULL,
            foto_ktp TEXT NOT NULL,
            foto_pemilik TEXT NOT NULL,
            aset TEXT NOT NULL
        )"""
        #create_table6 = """CREATE TABLE pilihan_toUp(
        #    ID_PILIHAN INTEGER PRIMARY KEY AUTOINCREMENT,
        #    nama_bank TEXT NOT NULL,
        #    biaya_admin INTEGER,
        #    virtual_account TEXT NOT NULL,
        #    keterangan TEXT NOT NULL,
        #    langkah_toUp TEXT NOT NULL
        # )"""
        create_table_transaksi = """CREATE TABLE transaksi(
            ID_TRANSAKSI INTEGER PRIMARY KEY AUTOINCREMENT,
            jumlah_transaksi INTEGER,
            tanggal_waktu_transaksi TEXT NOT NULL,
            jenis_transaksi TEXT NOT NULL,
            detail_transaksi TEXT NOT NULL,
            id_user INTEGER
        )"""
        create_table_peminjaman = """CREATE TABLE peminjaman(
            ID_PEMINJAMAN INTEGER PRIMARY KEY AUTOINCREMENT,
            jumlah_pinjaman INTEGER,
            status_pinjaman TEXT NOT NULL,
            status_pengajuan TEXT NOT NULL,
            waktu_pengajuan TEXT NOT NULL,
            waktu_pendanaan TEXT NOT NULL,
            jatuh_tempo TEXT NOT NULL,
            bagi_hasil INTEGER,
            tenor TEXT NOT NULL,
            penghasilan_perbulan INTEGER,
            jumlah_angsuran INTEGER,
            sisa_tenor INTEGER,
            nilai_rating TEXT NOT NULL,
            id_borrower INTEGER,
            FOREIGN KEY (id_borrower) REFERENCES user_borrower(ID_BORROWER)
        )"""
        create_table_investasi = """CREATE TABLE investasi(
            ID_INVESTASI INTEGER PRIMARY KEY AUTOINCREMENT,
            bagi_hasil_diterima TEXT NOT NULL,
            id_user INTEGER,
            id_peminjaman INTEGER,
            FOREIGN KEY (id_peminjaman) REFERENCES peminjaman(ID_PEMINJAMAN)
        )"""
        create_table_pengembalian = """CREATE TABLE pengembalian(
            ID_PENGEMBALIAN INTEGER PRIMARY KEY AUTOINCREMENT,
            batas_waktu_pengembalian TEXT NOT NULL,
            waktu_pengembalian TEXT NOT NULL,
            id_transaksi INTEGER,
            id_peminjaman INTEGER,
            FOREIGN KEY (id_peminjaman) REFERENCES peminjaman(ID_PEMINJAMAN),
            FOREIGN KEY (id_transaksi) REFERENCES transaksi(ID_TRANSAKSI)
        )"""
        # create_table_chat = """CREATE TABLE chat(
        #    ID_PESAN INTEGER PRIMARY KEY AUTOINCREMENT,
        #    isi_pesan TEXT NOT NULL,
        #    waktu_terkirim TEXT NOT NULL,
        #    id_investasi INTEGER,
        #    FOREIGN KEY (id_investasi) REFERENCES user_investor(ID_INVESTOR)
        #)"""
        
        cur.execute(create_table_user)
        cur.execute(create_table_umkm)
        cur.execute(create_table_pemilik_umkm)
        cur.execute(create_table_investor)
        cur.execute(create_table_transaksi)
        cur.execute(create_table_peminjaman)
        cur.execute(create_table_investasi)
        cur.execute(create_table_pengembalian)
        con.commit
    except:
        return ({"status":"terjadi error"})
    finally:
        con.close()
    return ({"status":"ok, db dan tabel berhasil dicreate"})

from pydantic import BaseModel

class User(BaseModel):
    email: str
    password: str
    no_telp: str
    foto_profil: str
    saldo: int | None = None

# Status code 201 standard return creation
# Return objek yang baru di-create (response_mode tipenya User)
@app.post("/tambah_User/", response_model=User, status_code=201)
def tambah_User(m: User, response: Response, request: Request):
    try:
        DB_NAME = "m2m.db"
        con = sqlite3.connect(DB_NAME)
        cur = con.cursor()
        # hanya untuk test, rawan sql injection, gunakan spt SQLAlchemy
        cur.execute("""insert into user
        (email,password,no_telp,foto_profil,saldo) values (
        "{}","{}","{}","{}",{})""".format(m.email,m.password,m.no_telp,m.foto_profil,m.saldo))
        con.commit()
    except:
        return ({"status":"terjadi error"})
    finally:
        con.close()
    # tambah location
    response.headers['location'] = "/user/{}".format(m.email)
    return m