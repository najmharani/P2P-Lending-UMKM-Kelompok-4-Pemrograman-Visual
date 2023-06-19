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
            aset INTEGER
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
@app.post("/tambah_User/", response_model=int, status_code=201)
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
        idUser = cur.lastrowid
        con.commit()
    except:
        return {"status": "terjadi error"}
    finally:
        con.close()
    # tambah location
    response.headers["location"] = "/get_user/{}".format(idUser)
    return idUser


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


@app.post("/login")
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

    except:
        return {"status": "terjadi error"}
    finally:
        con.close()
        return {"data": user}


@app.patch("/update_user/{id_user}", response_model=User)
def update_user(response: Response, id_user: int, m: User):
    try:
        print(str(m))
        DB_NAME = "m2m.db"
        con = sqlite3.connect(DB_NAME)
        cur = con.cursor()
        cur.execute(
            "select * from user where ID_USER = ?", (id_user,)
        )  # tambah koma untuk menandakan tupple
        existing_item = cur.fetchone()
    except Exception as e:
        raise HTTPException(
            status_code=500, detail="Terjadi exception: {}".format(str(e))
        )  # misal database down

    if existing_item:  # data ada, lakukan update
        sqlstr = "update user set "  # asumsi minimal ada satu field update
        # todo: bisa direfaktor dan dirapikan
        if m.email != "":
            if m.email != None:
                sqlstr = sqlstr + " email = '{}' ,".format(m.email)
            else:
                sqlstr = sqlstr + " email = null ,"

        if m.password != "":
            if m.password != None:
                sqlstr = sqlstr + " password = '{}' ,".format(m.password)
            else:
                sqlstr = sqlstr + " password = null ,"

        if m.no_telp != "":
            if m.no_telp != None:
                sqlstr = sqlstr + " no_telp = '{}' ,".format(m.no_telp)
            else:
                sqlstr = sqlstr + " no_telp = null, "

        if m.foto_profil != "":
            if m.foto_profil != None:
                sqlstr = sqlstr + " foto_profil = '{}' ,".format(m.foto_profil)
            else:
                sqlstr = sqlstr + " foto_profil = null, "

        if m.tipe_user != "":
            if m.tipe_user != None:
                sqlstr = sqlstr + " tipe_user = '{}' ,".format(m.tipe_user)
            else:
                sqlstr = sqlstr + " tipe_user = null, "

        if m.saldo != 0:
            if m.saldo != None:
                sqlstr = sqlstr + " saldo = {} ,".format(m.saldo)
            else:
                sqlstr = sqlstr + " saldo = null ,"

        if m.id_tipe_user != 0:
            if m.id_tipe_user != None:
                sqlstr = sqlstr + " id_tipe_user = {} ,".format(m.id_tipe_user)
            else:
                sqlstr = sqlstr + " id_tipe_user = null ,"

        sqlstr = sqlstr[:-1] + " where ID_USER='{}' ".format(
            id_user
        )  # buang koma yang trakhir
        print(sqlstr)
        try:
            cur.execute(sqlstr)
            con.commit()
            response.headers["location"] = "/user/{}".format(id_user)
        except Exception as e:
            raise HTTPException(
                status_code=500, detail="Terjadi exception: {}".format(str(e))
            )

    else:  # data tidak ada 404, item not found
        raise HTTPException(status_code=404, detail="Item Not Found")

    con.close()
    return m


@app.delete("/delete_user/{id}")
def delete_user(id: int):
    try:
        DB_NAME = "m2m.db"
        con = sqlite3.connect(DB_NAME)
        cur = con.cursor()
        sqlstr = "delete from user where ID_USER='{}'".format(id)
        print(sqlstr)  # debug
        cur.execute(sqlstr)
        con.commit()
    except:
        return {"status": "terjadi error"}
    finally:
        con.close()
    return {"status": "ok"}


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


@app.get("/get_peminjaman_belum_didanai/")
def get_peminjaman_belum_didanai():
    try:
        DB_NAME = "m2m.db"
        con = sqlite3.connect(DB_NAME)
        cur = con.cursor()
        recs = []
        for row in cur.execute(
            "select * from peminjaman where status_pengajuan != 'true'"
        ):
            recs.append(row)
    except:
        return {"status": "terjadi error"}
    finally:
        con.close()
        return {"data": recs}


@app.get("/detail_pinjaman/")
def detail_pinjaman():
    try:
        DB_NAME = "m2m.db"
        con = sqlite3.connect(DB_NAME)
        cur = con.cursor()
        recs = []
        for row in cur.execute(
            """
           SELECT * 
            FROM peminjaman
            JOIN umkm ON umkm.ID_BORROWER= peminjaman.id_borrower
			JOIN pemilik_umkm ON pemilik_umkm.ID_PEMILIK = umkm.id_pemilik_umkm
        """
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


class TransaksiM2m(BaseModel):
    ID_TRANSAKSI: int = None
    jumlah_transaksi: int | None = None
    tanggal_waktu_transaksi: str
    jenis_transaksi: str
    detail_transaksi: str
    id_user: int | None = None
    id_user_tujuan: int | None = None


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


@app.post("/TopUp_transaksi/", response_model=Transaksi, status_code=201)
def TopUp_transaksi(m: Transaksi, response: Response, request: Request):
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
        cur.execute(
            """UPDATE user set saldo = saldo + {} where id_user ={}""".format(
                m.jumlah_transaksi, m.id_user
            )
        )
        con.commit()
    except:
        return {"status": "terjadi error"}
    finally:
        con.close()
    # tambah location
    # response.headers["location"] = "/transaksi/{}".format(m.ID_TRANSAKSI)
    return m


@app.post("/witdhdraw_transaksi/", response_model=int, status_code=201)
def witdhdraw_transaksi(m: Transaksi, response: Response, request: Request):
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

        idTransaksi = cur.lastrowid

        cur.execute(
            """UPDATE user set saldo = saldo - {} where id_user ={}""".format(
                m.jumlah_transaksi, m.id_user
            )
        )

        con.commit()
    except:
        return {"status": "terjadi error"}
    finally:
        con.close()
    # tambah location
    # response.headers["location"] = "/transaksi/{}".format(m.ID_TRANSAKSI)
    return idTransaksi


@app.post("/pendanaan_transaksi/", response_model=TransaksiM2m, status_code=201)
def pendanaan_transaksi(m: TransaksiM2m, response: Response, request: Request):
    try:
        DB_NAME = "m2m.db"
        con = sqlite3.connect(DB_NAME)
        cur = con.cursor()
        # hanya untuk test, rawan sql injection, gunakan spt SQLAlchemy
        cur.execute(
            """insert into transaksi
        (jumlah_transaksi, tanggal_waktu_transaksi, jenis_transaksi, detail_transaksi, id_user, id_user_tujuan) values (
        {},"{}","{}","{}",{}, {})""".format(
                m.jumlah_transaksi,
                m.tanggal_waktu_transaksi,
                m.jenis_transaksi,
                m.detail_transaksi,
                m.id_user,
                m.id_user_tujuan,
            )
        )
        con.commit()
        cur.execute(
            """UPDATE user set saldo = saldo + {} where tipe_user='Borrower' AND id_user ={}""".format(
                m.jumlah_transaksi, m.id_user_tujuan
            )
        )
        con.commit()
        cur.execute(
            """UPDATE user set saldo = saldo - {} where tipe_user='Investor' AND id_user ={}""".format(
                m.jumlah_transaksi, m.id_user
            )
        )
        con.commit()
    except:
        return {"status": "terjadi error"}
    finally:
        con.close()
    # tambah location
    # response.headers["location"] = "/transaksi/{}".format(m.ID_TRANSAKSI)
    return m


@app.post("/pengembalian_transaksi/", response_model=TransaksiM2m, status_code=201)
def pengembalian_transaksi(m: TransaksiM2m, response: Response, request: Request):
    try:
        DB_NAME = "m2m.db"
        con = sqlite3.connect(DB_NAME)
        cur = con.cursor()
        # hanya untuk test, rawan sql injection, gunakan spt SQLAlchemy
        cur.execute(
            """insert into transaksi
        (jumlah_transaksi, tanggal_waktu_transaksi, jenis_transaksi, detail_transaksi, id_user, id_user_tujuan) values (
        {},"{}","{}","{}",{}, {})""".format(
                m.jumlah_transaksi,
                m.tanggal_waktu_transaksi,
                m.jenis_transaksi,
                m.detail_transaksi,
                m.id_user,
                m.id_user_tujuan,
            )
        )
        con.commit()
        cur.execute(
            """UPDATE user set saldo = saldo - {} where tipe_user='Borrower' AND id_user ={}""".format(
                m.jumlah_transaksi, m.id_user_tujuan
            )
        )
        con.commit()
        cur.execute(
            """UPDATE user set saldo = saldo + {} where tipe_user='Investor' AND id_user ={}""".format(
                m.jumlah_transaksi, m.id_user
            )
        )
        con.commit()
    except:
        return {"status": "terjadi error"}
    finally:
        con.close()
    # tambah location
    # response.headers["location"] = "/transaksi/{}".format(m.ID_TRANSAKSI)
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
def get_all_transaksi(id_user: int):
    try:
        DB_NAME = "m2m.db"
        con = sqlite3.connect(DB_NAME)
        cur = con.cursor()
        recs = []
        for row in cur.execute(
            "select * from transaksi WHERE id_user={}".format(id_user)
        ):
            recs.append(row)
    except:
        return {"status": "terjadi error"}
    finally:
        con.close()
        return {"data": recs}


@app.get("/get_transaksi_byDate/")  # gatau kenapa jadi gabisa nampilin outputnya
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
    aset: int | None = None


@app.post("/tambah_investor/", response_model=int, status_code=201)
def tambah_investor(m: Investor, response: Response, request: Request):
    try:
        DB_NAME = "m2m.db"
        con = sqlite3.connect(DB_NAME)
        cur = con.cursor()
        # hanya untuk test, rawan sql injection, gunakan spt SQLAlchemy
        cur.execute(
            """insert into profil_investor
        (nama_lengkap, tg_lahir, jenis_kelamin, nik, foto_ktp, foto_pemilik, aset) values (
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
        idInvestor = cur.lastrowid
        con.commit()
    except:
        return {"status": "terjadi error"}
    finally:
        con.close()
    # tambah location
    response.headers["location"] = "/profil_investor/{}".format(idInvestor)
    return idInvestor


@app.get("/get_all_investor/")
def get_all_investor():
    try:
        DB_NAME = "m2m.db"
        con = sqlite3.connect(DB_NAME)
        cur = con.cursor()
        recs = []
        for row in cur.execute("select * from profil_investor"):
            recs.append(row)
    except:
        return {"status": "terjadi error"}
    finally:
        con.close()
        return {"data": recs}


@app.get("/get_investor/{id_investor}")
def get_investor(id_investor: int):
    try:
        DB_NAME = "m2m.db"
        con = sqlite3.connect(DB_NAME)
        cur = con.cursor()
        recs = []
        for row in cur.execute(
            "select * from profil_investor WHERE ID_INVESTOR={}".format(id_investor)
        ):
            recs.append(row)

        user = {
            "idInvestor": recs[0][0],
            "namaLengkap": recs[0][1],
            "tanggalLahir": recs[0][2],
            "jenisKelamin": recs[0][3],
            "nik": recs[0][4],
            "fotoKtp": recs[0][5],
            "fotoPemilik": recs[0][6],
            "aset": recs[0][7],
        }

    except:
        return {"status": "terjadi error"}
    finally:
        con.close()
        return user


@app.patch("/update_investor/{id_investor}", response_model=Investor)
def update_investor(response: Response, id_investor: int, m: Investor):
    try:
        print(str(m))
        DB_NAME = "m2m.db"
        con = sqlite3.connect(DB_NAME)
        cur = con.cursor()
        cur.execute(
            "select * from profil_investor where ID_INVESTOR = ?", (id_investor,)
        )  # tambah koma untuk menandakan tupple
        existing_item = cur.fetchone()
    except Exception as e:
        raise HTTPException(
            status_code=500, detail="Terjadi exception: {}".format(str(e))
        )  # misal database down

    if existing_item:  # data ada, lakukan update
        sqlstr = "update profil_investor set "  # asumsi minimal ada satu field update
        # todo: bisa direfaktor dan dirapikan
        if m.nama_lengkap != "":
            if m.nama_lengkap != None:
                sqlstr = sqlstr + " nama_lengkap = '{}' ,".format(m.nama_lengkap)
            else:
                sqlstr = sqlstr + " nama_lengkap = null ,"

        if m.tgl_lahir != "":
            if m.tgl_lahir != None:
                sqlstr = sqlstr + " tg_lahir = '{}' ,".format(m.tgl_lahir)
            else:
                sqlstr = sqlstr + " tg_lahir = null ,"

        if m.jenis_kelamin != "":
            if m.jenis_kelamin != None:
                sqlstr = sqlstr + " jenis_kelamin = '{}' ,".format(m.jenis_kelamin)
            else:
                sqlstr = sqlstr + " jenis_kelamin = null, "

        if m.nik != "":
            if m.nik != None:
                sqlstr = sqlstr + " nik = '{}' ,".format(m.nik)
            else:
                sqlstr = sqlstr + " nik = null, "

        if m.foto_ktp != "":
            if m.foto_ktp != None:
                sqlstr = sqlstr + " foto_ktp = '{}' ,".format(m.foto_ktp)
            else:
                sqlstr = sqlstr + " foto_ktp = null, "

        if m.foto_investor != "":
            if m.foto_investor != None:
                sqlstr = sqlstr + " foto_pemilik = '{}' ,".format(m.foto_investor)
            else:
                sqlstr = sqlstr + " foto_pemilik = null ,"

        if m.aset != 0:
            if m.aset != None:
                sqlstr = sqlstr + " aset = {} ,".format(m.aset)
            else:
                sqlstr = sqlstr + " aset = null ,"

        sqlstr = sqlstr[:-1] + " where ID_INVESTOR='{}' ".format(
            id_investor
        )  # buang koma yang trakhir
        print(sqlstr)
        try:
            cur.execute(sqlstr)
            con.commit()
            response.headers["location"] = "/profil_investor/{}".format(id_investor)
        except Exception as e:
            raise HTTPException(
                status_code=500, detail="Terjadi exception: {}".format(str(e))
            )

    else:  # data tidak ada 404, item not found
        raise HTTPException(status_code=404, detail="Item Not Found")

    con.close()
    return m


# ============ Pemilik ============#


class PemilikUmkm(BaseModel):
    ID_PEMILIK: int = None
    nama_lengkap: str
    tgl_lahir: str
    jenis_kelamin: str
    nik: str
    foto_ktp: str
    foto_borrower: str


@app.post("/tambah_pemilik/", response_model=int, status_code=201)
def tambah_pemilik(m: PemilikUmkm, response: Response, request: Request):
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
                m.foto_borrower,
            )
        )

        id_pemilik = cur.lastrowid

        con.commit()
    except:
        return {"status": "terjadi error"}
    finally:
        con.close()
    # tambah location
    response.headers["location"] = "/pemilik_umkm/{}".format(m.ID_PEMILIK)
    return id_pemilik


@app.get("/get_all_pemilik/")
def get_all_pemilik():
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


@app.get("/get_pemilik/{id_pemilik}")
def get_pemilik(id_pemilik: int):
    try:
        DB_NAME = "m2m.db"
        con = sqlite3.connect(DB_NAME)
        cur = con.cursor()
        recs = []
        for row in cur.execute(
            "select * from pemilik_umkm WHERE ID_PEMILIK={}".format(id_pemilik)
        ):
            recs.append(row)

        pemilik = {
            "idPemilik": recs[0][0],
            "namaLengkap": recs[0][1],
            "tanggalLahir": recs[0][2],
            "jenisKelamin": recs[0][3],
            "nik": recs[0][4],
            "fotoKtp": recs[0][5],
            "fotoPemilik": recs[0][6],
        }

    except:
        return {"status": "terjadi error"}
    finally:
        con.close()
        return pemilik


@app.patch("/update_pemilik/{id_pemilik}", response_model=PemilikUmkm)
def update_pemilik(response: Response, id_pemilik: int, m: PemilikUmkm):
    try:
        print(str(m))
        DB_NAME = "m2m.db"
        con = sqlite3.connect(DB_NAME)
        cur = con.cursor()
        cur.execute(
            "select * from pemilik_umkm where ID_PEMILIK = ?", (id_pemilik,)
        )  # tambah koma untuk menandakan tupple
        existing_item = cur.fetchone()
    except Exception as e:
        raise HTTPException(
            status_code=500, detail="Terjadi exception: {}".format(str(e))
        )  # misal database down

    if existing_item:  # data ada, lakukan update
        sqlstr = "update pemilik_umkm set "  # asumsi minimal ada satu field update
        # todo: bisa direfaktor dan dirapikan
        if m.nama_lengkap != "":
            if m.nama_lengkap != None:
                sqlstr = sqlstr + " nama_lengkap = '{}' ,".format(m.nama_lengkap)
            else:
                sqlstr = sqlstr + " nama_lengkap = null ,"

        if m.tgl_lahir != "":
            if m.tgl_lahir != None:
                sqlstr = sqlstr + " tg_lahir = '{}' ,".format(m.tgl_lahir)
            else:
                sqlstr = sqlstr + " tg_lahir = null ,"

        if m.jenis_kelamin != "":
            if m.jenis_kelamin != None:
                sqlstr = sqlstr + " jenis_kelamin = '{}' ,".format(m.jenis_kelamin)
            else:
                sqlstr = sqlstr + " jenis_kelamin = null ,"

        if m.nik != "":
            if m.nik != None:
                sqlstr = sqlstr + " nik = '{}' ,".format(m.nik)
            else:
                sqlstr = sqlstr + " nik = null, "

        if m.foto_ktp != "":
            if m.foto_ktp != None:
                sqlstr = sqlstr + " foto_ktp = '{}' ,".format(m.foto_ktp)
            else:
                sqlstr = sqlstr + " foto_ktp = null, "

        if m.foto_borrower != "":
            if m.foto_borrower != None:
                sqlstr = sqlstr + " foto_pemilik = '{}' ,".format(m.foto_borrower)
            else:
                sqlstr = sqlstr + " foto_pemilik = null, "

        sqlstr = sqlstr[:-1] + " where ID_PEMILIK='{}' ".format(
            id_pemilik
        )  # buang koma yang trakhir
        print(sqlstr)
        try:
            cur.execute(sqlstr)
            con.commit()
            response.headers["location"] = "/pemilik_umkm/{}".format(id_pemilik)
        except Exception as e:
            raise HTTPException(
                status_code=500, detail="Terjadi exception: {}".format(str(e))
            )

    else:  # data tidak ada 404, item not found
        raise HTTPException(status_code=404, detail="Item Not Found")

    con.close()
    return m


# ============ UMKM ============#


class Umkm(BaseModel):
    ID_BORROWER: int = None
    nama_umkm: str
    alamat_umkm_provinsi: str
    alamat_umkm_detail: str
    jenis_usaha: str
    tahun_berdiri: str
    surat_izin_usaha: str
    npwp: str
    laporan_keuangan:str
    foto_umkm: str
    rating: str
    omzet: int
    deskripsi_umkm: str
    id_pemilik_umkm:int

@app.post("/tambah_umkm/", response_model=int, status_code=201)
def tambah_umkm(m: Umkm, response: Response, request: Request):
    try:
        DB_NAME = "m2m.db"
        con = sqlite3.connect(DB_NAME)
        cur = con.cursor()
        # hanya untuk test, rawan sql injection, gunakan spt SQLAlchemy
        cur.execute(
            """insert into umkm
        (nama_umkm, alamat_umkm_provinsi, alamat_umkm_detail, jenis_usaha, tahun_berdiri, surat_izin_usaha, npwp, laporan_keuangan, foto_umkm, rating, omzet,  deskripsi_umkm, id_pemilik_umkm) values (
        "{}","{}","{}","{}","{}","{}", "{}", "{}", "{}", "{}", {}, "{}", {})""".format(
                m.nama_umkm,
                m.alamat_umkm_provinsi,
                m.alamat_umkm_detail,
                m.jenis_usaha,
                m.tahun_berdiri,
                m.npwp,
                m.laporan_keuangan,
                m.foto_umkm,
                m.rating,
                m.omzet,
                m.deskripsi_umkm,
                m.id_pemilik_umkm
            )
        )

        id_pemilik = cur.lastrowid

        con.commit()
    except:
        return {"status": "terjadi error"}
    finally:
        con.close()
    # tambah location
    response.headers["location"] = "/umkm/{}".format(m.ID_BORROWER)
    return id_pemilik


@app.get("/get_all_umkm/")
def get_all_umkm():
    try:
        DB_NAME = "m2m.db"
        con = sqlite3.connect(DB_NAME)
        cur = con.cursor()
        recs = []
        for row in cur.execute("select * from umkm"):
            recs.append(row)
    except:
        return {"status": "terjadi error"}
    finally:
        con.close()
        return {"data": recs}


@app.get("/get_umkm/{id_umkm}")
def get_umkm(id_umkm: int):
    try:
        DB_NAME = "m2m.db"
        con = sqlite3.connect(DB_NAME)
        cur = con.cursor()
        recs = []
        for row in cur.execute(
            "select * from umkm WHERE ID_BORROWER={}".format(id_umkm)
        ):
            recs.append(row)

        umkm = {
            "ID_BORROWER": recs[0][0],
            "nama_umkm": recs[0][1],
            "alamat_umkm_provinsi": recs[0][2],
            "alamat_umkm_detail": recs[0][3],
            "jenis_usaha": recs[0][4],
            "tahun_berdiri": recs[0][5],
            "surat_izin_usaha": recs[0][6],
            "npwp": recs[0][7],
            "laporan_keuangan": recs[0][8],
            "foto_umkm": recs[0][9],
            "rating": recs[0][10],
            "omzet": recs[0][11],
            "deskripsi_umkm": recs[0][12],
            "id_pemilik_umkm": recs[0][13],
        }

    except:
        return {"status": "terjadi error"}
    finally:
        con.close()
        return umkm


@app.patch("/update_umkm/{id_umkm}", response_model=Umkm)
def update_umkm(response: Response, id_umkm: int, m: Umkm):
    try:
        print(str(m))
        DB_NAME = "m2m.db"
        con = sqlite3.connect(DB_NAME)
        cur = con.cursor()
        cur.execute(
            "select * from umkm where ID_BORROWER = ?", (id_umkm,)
        )  # tambah koma untuk menandakan tupple
        existing_item = cur.fetchone()
    except Exception as e:
        raise HTTPException(
            status_code=500, detail="Terjadi exception: {}".format(str(e))
        )  # misal database down

    if existing_item:  # data ada, lakukan update
        sqlstr = "update umkm set "  # asumsi minimal ada satu field update
        # todo: bisa direfaktor dan dirapikan
        if m.nama_umkm != "":
            if m.nama_umkm != None:
                sqlstr = sqlstr + " nama_umkm = '{}' ,".format(m.nama_umkm)
            else:
                sqlstr = sqlstr + " nama_umkm = null ,"

        if m.alamat_umkm_provinsi != "":
            if m.alamat_umkm_provinsi != None:
                sqlstr = sqlstr + " alamat_umkm_provinsi = '{}' ,".format(m.alamat_umkm_provinsi)
            else:
                sqlstr = sqlstr + " alamat_umkm_provinsi = null ,"

        if m.alamat_umkm_detail != "":
            if m.alamat_umkm_detail != None:
                sqlstr = sqlstr + " alamat_umkm_detail = '{}' ,".format(m.alamat_umkm_detail)
            else:
                sqlstr = sqlstr + " alamat_umkm_detail = null ,"

        if m.jenis_usaha != "":
            if m.jenis_usaha != None:
                sqlstr = sqlstr + " jenis_usaha = '{}' ,".format(m.jenis_usaha)
            else:
                sqlstr = sqlstr + " jenis_usaha = null, "

        if m.tahun_berdiri != "":
            if m.tahun_berdiri != None:
                sqlstr = sqlstr + " tahun_berdiri = '{}' ,".format(m.tahun_berdiri)
            else:
                sqlstr = sqlstr + " tahun_berdiri = null, "

        if m.surat_izin_usaha != "":
            if m.surat_izin_usaha != None:
                sqlstr = sqlstr + " surat_izin_usaha = '{}' ,".format(m.surat_izin_usaha)
            else:
                sqlstr = sqlstr + " surat_izin_usaha = null, "
            
        if m.npwp != "":
            if m.npwp != None:
                sqlstr = sqlstr + " npwp = '{}' ,".format(m.npwp)
            else:
                sqlstr = sqlstr + " npwp = null, "
                
        if m.laporan_keuangan != "":
            if m.laporan_keuangan != None:
                sqlstr = sqlstr + " laporan_keuangan = '{}' ,".format(m.laporan_keuangan)
            else:
                sqlstr = sqlstr + " laporan_keuangan = null, "
                
        if m.foto_umkm != "":
            if m.foto_umkm != None:
                sqlstr = sqlstr + " foto_umkm = '{}' ,".format(m.foto_umkm)
            else:
                sqlstr = sqlstr + " foto_umkm = null, "
                
        if m.rating != "":
            if m.rating != None:
                sqlstr = sqlstr + " rating = '{}' ,".format(m.rating)
            else:
                sqlstr = sqlstr + " rating = null, "
                
        if m.omzet != 0:
            if m.omzet != None:
                sqlstr = sqlstr + " omzet = '{}' ,".format(m.omzet)
            else:
                sqlstr = sqlstr + " omzet = null, "
                
        if m.deskripsi_umkm != "":
            if m.deskripsi_umkm != None:
                sqlstr = sqlstr + " deskripsi_umkm = '{}' ,".format(m.deskripsi_umkm)
            else:
                sqlstr = sqlstr + " deskripsi_umkm = null, "
                
        if m.id_pemilik_umkm != 0:
            if m.id_pemilik_umkm != None:
                sqlstr = sqlstr + " id_pemilik_umkm = '{}' ,".format(m.id_pemilik_umkm)
            else:
                sqlstr = sqlstr + " id_pemilik_umkm = null, "

        sqlstr = sqlstr[:-1] + " where ID_BORROWER='{}' ".format(
            id_umkm
        )  # buang koma yang trakhir
        print(sqlstr)
        try:
            cur.execute(sqlstr)
            con.commit()
            response.headers["location"] = "/umkm/{}".format(id_umkm)
        except Exception as e:
            raise HTTPException(
                status_code=500, detail="Terjadi exception: {}".format(str(e))
            )

    else:  # data tidak ada 404, item not found
        raise HTTPException(status_code=404, detail="Item Not Found")

    con.close()
    return m


# =================== INVESTASI ===============#


class Investasi(BaseModel):
    ID_INVESTASI: int = None
    bagi_hasil_diterima: str
    id_user: int | None = None
    id_peminjaman: int | None = None


@app.post("/tambah_investasi/", response_model=Investasi, status_code=201)
def tambah_investasi(m: Investasi, response: Response, request: Request):
    try:
        DB_NAME = "m2m.db"
        con = sqlite3.connect(DB_NAME)
        cur = con.cursor()
        # hanya untuk test, rawan sql injection, gunakan spt SQLAlchemy
        cur.execute(
            """insert into investasi
        (bagi_hasil_diterima, id_user, id_peminjaman) values (
        "{}",{},{})""".format(
                m.bagi_hasil_diterima, m.id_user, m.id_peminjaman
            )
        )
        con.commit()
    except:
        return {"status": "terjadi error"}
    finally:
        con.close()
    # tambah location
    response.headers["location"] = "/investasi/{}".format(m.ID_INVESTASI)
    return m


@app.get("/get_all_investasi/")
def get_all_investasi():
    try:
        DB_NAME = "m2m.db"
        con = sqlite3.connect(DB_NAME)
        cur = con.cursor()
        recs = []
        for row in cur.execute("select * from investasi"):
            recs.append(row)
    except:
        return {"status": "terjadi error"}
    finally:
        con.close()
        return {"data": recs}


@app.get("/get_all_investasi/{id_investasi}")
def get_all_investasi(id_investasi: int):
    try:
        DB_NAME = "m2m.db"
        con = sqlite3.connect(DB_NAME)
        cur = con.cursor()
        recs = []
        for row in cur.execute(
            "select * from investasi WHERE ID_INVESTASI={}".format(id_investasi)
        ):
            recs.append(row)
    except:
        return {"status": "terjadi error"}
    finally:
        con.close()
        return {"data": recs}


@app.patch("/update_investasi/{id_investasi}", response_model=Investasi)
def update_investasi(response: Response, id_investasi: int, m: Investasi):
    try:
        print(str(m))
        DB_NAME = "m2m.db"
        con = sqlite3.connect(DB_NAME)
        cur = con.cursor()
        cur.execute(
            "select * from investasi where ID_INVESTASI = ?", (id_investasi,)
        )  # tambah koma untuk menandakan tupple
        existing_item = cur.fetchone()
    except Exception as e:
        raise HTTPException(
            status_code=500, detail="Terjadi exception: {}".format(str(e))
        )  # misal database down

    if existing_item:  # data ada, lakukan update
        sqlstr = "update investasi set "  # asumsi minimal ada satu field update
        # todo: bisa direfaktor dan dirapikan
        if m.bagi_hasil_diterima != "":
            if m.bagi_hasil_diterima != None:
                sqlstr = sqlstr + " bagi_hasil_diterima = '{}' ,".format(
                    m.bagi_hasil_diterima
                )
            else:
                sqlstr = sqlstr + " bagi_hasil_diterima = null ,"

        if m.id_user != 0:
            if m.id_user != None:
                sqlstr = sqlstr + " id_user = {} ,".format(m.id_user)
            else:
                sqlstr = sqlstr + " id_user = null ,"

        if m.id_peminjaman != 0:
            if m.id_peminjaman != None:
                sqlstr = sqlstr + " id_peminjaman = {} ,".format(m.id_peminjaman)
            else:
                sqlstr = sqlstr + " id_peminjaman = null ,"

        sqlstr = sqlstr[:-1] + " where ID_INVESTASI='{}' ".format(
            id_investasi
        )  # buang koma yang trakhir
        print(sqlstr)
        try:
            cur.execute(sqlstr)
            con.commit()
            response.headers["location"] = "/investasi/{}".format(id_investasi)
        except Exception as e:
            raise HTTPException(
                status_code=500, detail="Terjadi exception: {}".format(str(e))
            )

    else:  # data tidak ada 404, item not found
        raise HTTPException(status_code=404, detail="Item Not Found")

    con.close()
    return m
