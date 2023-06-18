import sqlite3
from typing import Union
from fastapi import FastAPI, Request, Response
from pydantic import BaseModel
from http_exceptions import HTTPException
from fastapi.middleware.cors import CORSMiddleware
from fastapi import FastAPI

app = FastAPI()
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


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
        # create_table6 = """CREATE TABLE pilihan_toUp(
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
        create_table_bank_account = """CREATE TABLE bank_account(
            ID_BANK INTEGER PRIMARY KEY AUTOINCREMENT,
            nama_bank TEXT NOT NULL,
            no_rekening TEXT NOT NULL,
            nama_rekening TEXT NOT NULL,
            id_user INTEGER
        )"""
        # create_table_chat = """CREATE TABLE chat(
        #    ID_PESAN INTEGER PRIMARY KEY AUTOINCREMENT,
        #    isi_pesan TEXT NOT NULL,
        #    waktu_terkirim TEXT NOT NULL,
        #    id_investasi INTEGER,
        #    FOREIGN KEY (id_investasi) REFERENCES user_investor(ID_INVESTOR)
        # )"""

        cur.execute(create_table_user)
        cur.execute(create_table_umkm)
        cur.execute(create_table_pemilik_umkm)
        cur.execute(create_table_investor)
        cur.execute(create_table_transaksi)
        cur.execute(create_table_peminjaman)
        cur.execute(create_table_investasi)
        cur.execute(create_table_pengembalian)
        cur.execute(create_table_bank_account)
        con.commit
    except:
        return {"status": "terjadi error"}
    finally:
        con.close()
    return {"status": "ok, db dan tabel berhasil dicreate"}


# ================= USER =====================#


class User(BaseModel):
    ID_USER: int = None
    email: str
    password: str
    no_telp: str
    foto_profil: str
    saldo: int | None = None
    tipe_user: str
    id_tipe_user: int | None = None


# Status code 201 standard return creation
# Return objek yang baru di-create (response_mode tipenya User)
@app.post("/tambah_User/", response_model=User, status_code=201)
def tambah_User(m: User, response: Response, request: Request):
    try:
        DB_NAME = "m2m.db"
        con = sqlite3.connect(DB_NAME)
        cur = con.cursor()
        # hanya untuk test, rawan sql injection, gunakan spt SQLAlchemy
        cur.execute(
            """insert into user
        (email,password,no_telp,foto_profil,saldo, tipe_user, id_tipe_user) values (
        "{}","{}","{}","{}",{},"{}",{})""".format(
                m.email,
                m.password,
                m.no_telp,
                m.foto_profil,
                m.saldo,
                m.tipe_user,
                m.id_tipe_user,
            )
        )
        con.commit()
    except:
        return {"status": "terjadi error"}
    finally:
        con.close()
    # tambah location
    response.headers["location"] = "/user/{}".format(m.ID_USER)
    return m


@app.get("/get_all_user/")
def get_all_user():
    try:
        DB_NAME = "m2m.db"
        con = sqlite3.connect(DB_NAME)
        cur = con.cursor()
        recs = []
        for row in cur.execute("select * from user"):
            recs.append(row)
    except:
        return {"status": "terjadi error"}
    finally:
        con.close()
        return {"data": recs}


@app.get("/get_user/{id}")
def get_user(id: int):
    try:
        DB_NAME = "m2m.db"
        con = sqlite3.connect(DB_NAME)
        cur = con.cursor()
        recs = []
        for row in cur.execute("select * from user where ID_USER={}".format(id)):
            recs.append(row)
    except:
        return {"status": "terjadi error"}
    finally:
        con.close()
        return {"data": recs}


@app.post("/login/")
def login_auth(user: User):
    try:
        DB_NAME = "m2m.db"
        con = sqlite3.connect(DB_NAME)
        cur = con.cursor()
        recs = []
        for row in cur.execute("select * from user"):
            recs.append(row)

        user_valid = None
        for rec in recs:
            if rec[1] == user.email:
                user_valid = rec
                break

        if user_valid is None:
            raise HTTPException(status_code=400, detail="Email tidak terdaftar")

        if user_valid[2] != user.password:
            raise HTTPException(status_code=400, detail="Password salah")

        user = {
            "idUser": user_valid[0],
            "email": user_valid[1],
            "password": user_valid[2],
            "noTelp": user_valid[3],
            "fotoProfil": user_valid[4],
            "saldo": user_valid[5],
            "tipeUser": user_valid[6],
            "idTipeUser": user_valid[7],
        }

    # except:
    #     return {"status": "terjadi error"}
    # finally:
    #     con.close()
    #     return {"data": recs}
    # user = {
    #     "idUser": row[0],
    #     "email": row[1],
    #     "password": row[2],
    #     "noTelp": row[3],
    #     "fotoProfil": row[4],
    #     "saldo": row[5],
    #     "tipeUser": row[6],
    #     "idTipeUser": row[7],
    # }

    except:
        return {"status": "terjadi error"}
    finally:
        con.close()
        return {"data": user}


@app.get("/login_auth/email={email}&password={password}")
def login_auth(email: str, password: str):
    try:
        DB_NAME = "m2m.db"
        con = sqlite3.connect(DB_NAME)
        cur = con.cursor()
        rec = cur.execute(
            "select * from user where email='{}' and password='{}'".format(
                email, password
            )
        )
        row = rec.fetchone()
        user = {
            "idUser": row[0],
            "email": row[1],
            "password": row[2],
            "noTelp": row[3],
            "fotoProfil": row[4],
            "saldo": row[5],
            "tipeUser": row[6],
            "idTipeUser": row[7],
        }

    except:
        return {"status": "terjadi error"}
    finally:
        con.close()
        return user


# patch hanya sebagian saja yang diupdate
# asumsikan kalau isinya "" dan 0 artinya tidak berubah
@app.patch("/update_user/{id}", response_model=User)
def update_user(response: Response, id: int, m: User):
    # update keseluruhan
    try:
        DB_NAME = "upi.db"
        con = sqlite3.connect(DB_NAME)
        cur = con.cursor()
        # proses yang isinya "" atau 0 dianggap tidak ada perubahan. asumsikan db diinit dengan "" dan 0 semua.
        # todo: memproses None atau Null
        # sqlstr = "update mahasiswa set nama = '{}',id_prov = '{}', angkatan='{}', tinggi_badan={} where nim='{}'".format(m.nama,m.id_prov,m.angkatan,m.tinggi_badan,m.nim)
        sqlstr = "update user set "  # asumsi minimal ada satu update
        if m.email != "":
            sqlstr = sqlstr + " email = '{}' ".format(m.email)
        if m.password != "":
            sqlstr = sqlstr + " password = '{}' ".format(m.password)
        if m.foto_profil != "":
            sqlstr = sqlstr + " foto_profil = '{}' ".format(m.foto_profil)
        if m.saldo != 0:
            sqlstr = sqlstr + " saldo = {} ".format(m.saldo)
        sqlstr = sqlstr + "where ID_USER='{}'".format(id)
        print(sqlstr)  # debug
        cur.execute(sqlstr)
        con.commit()
        response.headers["location"] = "/get_user/{}".format(m.ID_USER)
    except:
        return {"status": "terjadi error"}
    finally:
        con.close()
    return m


# =============== PEMINJAMAN ============#


class Peminjaman(BaseModel):
    ID_PEMINJAMAN: int = None
    jumlah_pinjaman: int | None = None
    status_pinjaman: str
    status_pengajuan: str
    waktu_pengajuan: str
    waktu_pendanaan: str
    jatuh_tempo: str
    bagi_hasil: int | None = None
    tenor: str
    penghasilan_perbulan: int | None = None
    jumlah_angsuran: int | None = None
    sisa_tenor: int | None = None
    nilai_rating: str
    id_borrower: int = None


# Status code 201 standard return creation
# Return objek yang baru di-create (response_mode tipenya User)
@app.post("/tambah_peminjaman/", response_model=Peminjaman, status_code=201)
def tambah_peminjaman(m: Peminjaman, response: Response, request: Request):
    try:
        DB_NAME = "m2m.db"
        con = sqlite3.connect(DB_NAME)
        cur = con.cursor()
        # hanya untuk test, rawan sql injection, gunakan spt SQLAlchemy
        cur.execute(
            """insert into peminjaman
        (jumlah_pinjaman, status_pinjaman, status_pengajuan, waktu_pengajuan, waktu_pendanaan, jatuh_tempo, bagi_hasil, tenor, penghasilan_perbulan, jumlah_angsuran, sisa_tenor, nilai_rating) values (
        {},"{}","{}","{}","{}","{}",{},"{}",{},{},{},"{}")""".format(
                m.jumlah_pinjaman,
                m.status_pinjaman,
                m.status_pengajuan,
                m.waktu_pengajuan,
                m.waktu_pendanaan,
                m.jatuh_tempo,
                m.bagi_hasil,
                m.tenor,
                m.penghasilan_perbulan,
                m.jumlah_angsuran,
                m.sisa_tenor,
                m.nilai_rating,
            )
        )
        con.commit()
    except:
        return {"status": "terjadi error"}
    finally:
        con.close()
    # tambah location
    response.headers["location"] = "/peminjaman/{}".format(m.ID_PEMINJAMAN)
    return m


@app.get("/get_all_peminjaman/")
def get_all_peminjaman():
    try:
        DB_NAME = "m2m.db"
        con = sqlite3.connect(DB_NAME)
        cur = con.cursor()
        recs = []
        for row in cur.execute("select * from peminjaman"):
            recs.append(row)
    except:
        return {"status": "terjadi error"}
    finally:
        con.close()
        return {"data": recs}


@app.get("/get_peminjaman/{id}")
def get_peminjaman(id: int):
    try:
        DB_NAME = "m2m.db"
        con = sqlite3.connect(DB_NAME)
        cur = con.cursor()
        recs = []
        for row in cur.execute(
            "select * from peminjaman WHERE ID_PEMINJAMAN={}".format(id)
        ):
            recs.append(row)
    except:
        return {"status": "terjadi error"}
    finally:
        con.close()
        return {"data": recs}


# =========== TRANSAKSI ==========#


class Transaksi(BaseModel):
    ID_TRANSAKSI: int = None
    jumlah_transaksi: int | None = None
    tanggal_waktu_transaksi: str
    jenis_transaksi: str
    detail_transaksi: str
    id_user: int | None = None


# Status code 201 standard return creation
# Return objek yang baru di-create (response_mode tipenya User)
@app.post("/tambah_transaksi/", response_model=Transaksi, status_code=201)
def tambah_transaksi(m: Transaksi, response: Response, request: Request):
    try:
        DB_NAME = "m2m.db"
        con = sqlite3.connect(DB_NAME)
        cur = con.cursor()
        # hanya untuk test, rawan sql injection, gunakan spt SQLAlchemy
        cur.execute(
            """insert into transaksi
        (jumlah_transaksi, tanggal_waktu_transaksi, jenis_transaksi, detail_transaksi, id_user) values (
        {},"{}","{}","{}",{})""".format(
                m.jumlah_transaksi,
                m.tanggal_waktu_transaksi,
                m.jenis_transaksi,
                m.detail_transaksi,
                m.id_user,
            )
        )
        con.commit()
    except:
        return {"status": "terjadi error"}
    finally:
        con.close()
    # tambah location
    response.headers["location"] = "/transaksi/{}".format(m.ID_TRANSAKSI)
    return m


@app.get("/get_all_transaksi/")
def get_all_transaksi():
    try:
        DB_NAME = "m2m.db"
        con = sqlite3.connect(DB_NAME)
        cur = con.cursor()
        recs = []
        for row in cur.execute("select * from transaksi"):
            recs.append(row)
    except:
        return {"status": "terjadi error"}
    finally:
        con.close()
        return {"data": recs}


@app.get("/get_all_transaksi/{id_user}")
def get_all_transaksi(id: int):
    try:
        DB_NAME = "m2m.db"
        con = sqlite3.connect(DB_NAME)
        cur = con.cursor()
        recs = []
        for row in cur.execute("select * from transaksi WHERE id_user={}".format(id)):
            recs.append(row)
    except:
        return {"status": "terjadi error"}
    finally:
        con.close()
        return {"data": recs}


@app.get("/get_transaksi_byDate/")
def get_transaksi_byDate(tgl_waktu: str):
    try:
        DB_NAME = "m2m.db"
        con = sqlite3.connect(DB_NAME)
        cur = con.cursor()
        recs = []
        for row in cur.execute(
            "select * from transaksi WHERE tanggal_waktu_transaksi={}".format(tgl_waktu)
        ):
            recs.append(row)
    except:
        return {"status": "terjadi error"}
    finally:
        con.close()
        return {"data": recs}


@app.get("/get_detil_transaksi/{id_transaksi}")
def get_detil_transaksi(id: int):
    try:
        DB_NAME = "m2m.db"
        con = sqlite3.connect(DB_NAME)
        cur = con.cursor()
        recs = []
        for row in cur.execute(
            "select detail_transaksi from transaksi WHERE ID_TRANSAKSI={}".format(id)
        ):
            recs.append(row)
    except:
        return {"status": "terjadi error"}
    finally:
        con.close()
        return {"data": recs}


# ============= BANK ACCOUNT ============#


class BANK(BaseModel):
    ID_BANK: int = None
    nama_bank: str
    no_rekening: str
    nama_rekening: str
    id_user: int | None = None


# Status code 201 standard return creation
# Return objek yang baru di-create (response_mode tipenya User)
@app.post("/tambah_bank_akun/", response_model=BANK, status_code=201)
def tambah_bank_akun(m: BANK, response: Response, request: Request):
    try:
        DB_NAME = "m2m.db"
        con = sqlite3.connect(DB_NAME)
        cur = con.cursor()
        # hanya untuk test, rawan sql injection, gunakan spt SQLAlchemy
        cur.execute(
            """insert into bank_account
        (nama_bank, no_rekening, nama_rekening, id_user) values (
        "{}","{}","{}",{})""".format(
                m.nama_bank, m.no_rekening, m.nama_rekening, m.id_user
            )
        )
        con.commit()
    except:
        return {"status": "terjadi error"}
    finally:
        con.close()
    # tambah location
    response.headers["location"] = "/bank_account/{}".format(m.ID_BANK)
    return m


@app.get("/get_all_akun_bank/")
def get_all_akun_bank():
    try:
        DB_NAME = "m2m.db"
        con = sqlite3.connect(DB_NAME)
        cur = con.cursor()
        recs = []
        for row in cur.execute("select * from bank_account"):
            recs.append(row)
    except:
        return {"status": "terjadi error"}
    finally:
        con.close()
        return {"data": recs}


@app.get("/get_all_akun_bank/{id_user}")
def get_all_akun_bank(id_user: int):
    try:
        DB_NAME = "m2m.db"
        con = sqlite3.connect(DB_NAME)
        cur = con.cursor()
        recs = []
        for row in cur.execute(
            "select * from bank_account WHERE id_user={}".format(id_user)
        ):
            recs.append(row)
    except:
        return {"status": "terjadi error"}
    finally:
        con.close()
        return {"data": recs}


@app.get("/get_detil_akun_bank/{id_bank}")
def get_detil_akun_bank(id_bank: int):
    try:
        DB_NAME = "m2m.db"
        con = sqlite3.connect(DB_NAME)
        cur = con.cursor()
        recs = []
        for row in cur.execute(
            "select * from bank_account WHERE ID_BANK={}".format(id_bank)
        ):
            recs.append(row)
    except:
        return {"status": "terjadi error"}
    finally:
        con.close()
        return {"data": recs}


# ================== INVESTOR =================#


class Investor(BaseModel):
    ID_INVESTOR: int | None = None
    nama_lengkap: str
    tgl_lahir: str
    jenis_kelamin: str
    nik: str
    foto_ktp: str
    foto_investor: str
    aset: str


# Status code 201 standard return creation
# Return objek yang baru di-create (response_mode tipenya User)
@app.post("/tambah_investor/", response_model=Investor, status_code=201)
def tambah_investor(m: Investor, response: Response, request: Request):
    try:
        DB_NAME = "m2m.db"
        con = sqlite3.connect(DB_NAME)
        cur = con.cursor()
        # hanya untuk test, rawan sql injection, gunakan spt SQLAlchemy
        cur.execute(
            """insert into profil_invstor
        (nama_lengkap, tgl_lahir, jenis_kelamin, nik, foto_ktp, foto_pemilik, aset) values (
        "{}","{}","{}","{}","{}","{}","{}")""".format(
                m.nama_lengkap,
                m.tgl_lahir,
                m.jenis_kelamin,
                m.nik,
                m.foto_ktp,
                m.foto_investor,
                m.aset,
            )
        )
        con.commit()
    except:
        return {"status": "terjadi error"}
    finally:
        con.close()
    # tambah location
    response.headers["location"] = "/profil_investor/{}".format(m.ID_INVESTOR)
    return m


@app.get("/get_all_investor/")
def get_all_investor():
    try:
        DB_NAME = "m2m.db"
        con = sqlite3.connect(DB_NAME)
        cur = con.cursor()
        recs = []
        for row in cur.execute("select * from investor"):
            recs.append(row)
    except:
        return {"status": "terjadi error"}
    finally:
        con.close()
        return {"data": recs}

#============ BORROWER ============#

class PemilikUmkm(BaseModel):
    ID_PEMILIK: int | None = None
    nama_lengkap: str
    tgl_lahir: str
    jenis_kelamin: str
    nik: str
    foto_ktp: str
    foto_borrower: str
    
@app.post("/tambah_borrower/", response_model=PemilikUmkm, status_code=201)
def tambah_borrower(m: PemilikUmkm, response: Response, request: Request):
    try:
        DB_NAME = "m2m.db"
        con = sqlite3.connect(DB_NAME)
        cur = con.cursor()
        # hanya untuk test, rawan sql injection, gunakan spt SQLAlchemy
        cur.execute(
            """insert into pemilik_umkm
        (nama_lengkap, tg_lahir, jenis_kelamin, nik, foto_ktp, foto_pemilik) values (
        "{}","{}","{}","{}","{}","{}")""".format(
                m.nama_lengkap,
                m.tgl_lahir,
                m.jenis_kelamin,
                m.nik,
                m.foto_ktp,
                m.foto_borrower
            )
        )
        con.commit()
    except:
        return {"status": "terjadi error"}
    finally:
        con.close()
    # tambah location
    response.headers["location"] = "/pemilik_umkm/{}".format(m.ID_PEMILIK)
    return m

@app.get("/get_all_borrower/")
def get_all_borrower():
    try:
        DB_NAME = "m2m.db"
        con = sqlite3.connect(DB_NAME)
        cur = con.cursor()
        recs = []
        for row in cur.execute("select * from pemilik_umkm"):
            recs.append(row)
    except:
        return {"status": "terjadi error"}
    finally:
        con.close()
        return {"data": recs}
    
@app.get("/get_all_borrower/{id_borrower}")
def get_all_borrower(id_pemilik: int):
    try:
        DB_NAME = "m2m.db"
        con = sqlite3.connect(DB_NAME)
        cur = con.cursor()
        recs = []
        for row in cur.execute("select * from pemilik_umkm WHERE ID_PEMILIK={}".format(id_pemilik)):
            recs.append(row)
    except:
        return {"status": "terjadi error"}
    finally:
        con.close()
        return {"data": recs}

@app.patch("/update_borrower/{id}",response_model=PemilikUmkm)
def update_borrower(response: Response,ID_PEMILIK: int, m: PemilikUmkm):
    try:
        DB_NAME = "m2m.db"
        con = sqlite3.connect(DB_NAME)
        cur = con.cursor()
        sqlstr = "UPDATE pemilik_umkm set " #asumsi minimal ada satu update
        if m.nama_lengkap!="":
            sqlstr = sqlstr + " nama_lengkap = '{}' ".format(m.nama_lengkap)
        if m.jenis_kelamin!="":
            sqlstr = sqlstr + " jenis_kelamin = '{}' ".format(m.jenis_kelamin)
        if m.nik!="":
            sqlstr = sqlstr + " nik = '{}' ".format(m.nik)
        if m.foto_ktp!="":
            sqlstr = sqlstr + " foto_ktp = '{}' ".format(m.foto_ktp)
        if m.foto_borrower!="":
            sqlstr = sqlstr + " foto_pemilik = '{}' ".format(m.foto_borrower)
        sqlstr = sqlstr + "where ID_PEMILIK='{}'".format(m.ID_PEMILIK)
        print(sqlstr) # debug
        cur.execute(sqlstr)
        con.commit()
        response.headers["location"] = "/pemilik_umkm/{}".format(m.ID_PEMILIK)
    except:
        return ({"status":"terjadi error"})
    finally:
        con.close()
    return m