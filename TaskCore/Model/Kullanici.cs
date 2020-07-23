using Microsoft.AspNetCore.Http;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using TaskCore.Core;
using TaskCore.Database;
using TaskCore.NetCore;
using TaskCore.NetCore.Utils;

namespace TaskCore.Model
{
    public class Kullanici
    {

        public long Id { get; set; }
        public long refKullaniciGrup { get; set; }
        public string KullaniciGrupAd { get; set; }
        public string LoginRedirectUrl { get; set; }
        public string Token { get; set; }
        public string AdSoyad { get; set; }
        public string Eposta { get; set; }
        public string Telefon { get; set; }
        public string Parola { get; set; }
        public bool Aktif { get; set; }
        public string RecordTime { get; set; }
        public string _Platform { get; set; }
        public string PlatformToken { get; set; }
        public List<Yetki> Yetkiler { get; set; }

        public static Kullanici Parse(DataRow row)
        {
            return new Kullanici
            {
                Id = row.GetLong("Id"),
                AdSoyad = row.GetString("AdSoyad"),
                Eposta = row.GetString("Eposta"),
                Token = row.GetString("Token"),
                Aktif = row.GetBool("Aktif"),
                Telefon = row.GetString("Telefon"),
                RecordTime = row.GetString("RecordTime"),
                PlatformToken = row.GetString("PlatformToken"),
                _Platform = row.GetString("Platform"),
                refKullaniciGrup = row.GetLong("refKullaniciGrup"),
                KullaniciGrupAd = row.GetString("KullaniciGrupAd"),
                LoginRedirectUrl = row.GetString("LoginRedirectUrl"),
                Yetkiler = new List<Yetki>()
            };
        }

        public bool IsValid(bool isUpdate = false)
        {
            if (isUpdate && Id <= 0)
                return false;

            if (string.IsNullOrEmpty(AdSoyad))
                return false;

            if (string.IsNullOrEmpty(Eposta))
                return false;

            if (!isUpdate && string.IsNullOrEmpty(Parola))
                return false;

            return true;
        }

        public static Kullanici Oturum(long? id = null)
        {
            if (id != null)
            {
                Kullanici kullanici = new Kullanici();
                kullanici.Id = (long)id;
                return kullanici;
            }

            if (ContextObject.Current.Session.GetString("Kullanici") == null)
                return new Kullanici();
            Kullanici k = JsonConvert.DeserializeObject<Kullanici>(ContextObject.Current.Session.GetString("Kullanici"));
            return JsonConvert.DeserializeObject<Kullanici>(ContextObject.Current.Session.GetString("Kullanici"));
        }

        public static string ParolaGuncelle(string kullaniciToken, string parola)
        {

            return Sql.GetInstance().Get("sp_kullanici_parola_guncelle", new List<object> {
                kullaniciToken,
                parola
                }, (row) =>
                {
                    return row.GetString("Result");
                });

        }

        public bool IsAuthorized(string controller, string action, string platform = Platform.WEB)
        {
            if (string.IsNullOrEmpty(controller)
                || string.IsNullOrEmpty(action)
                || string.IsNullOrEmpty(platform))
                return false;

            controller = controller.ToLower();
            action = action.ToLower();
            platform = platform.ToLower();

            foreach (var item in Yetkiler)
            {
                if (!platform.Equals(item.Platform.ToLower()))
                    continue;

                if (("*".Equals(item.Controller) || item.Controller.ToLower().Equals(controller))
                     && ("*".Equals(item.Action) || ("*".Equals(action) || item.Action.ToLower().Equals(action))))
                    return true;
            }

            return false;
        }

        public static Kullanici Giris(string kullaniciadi, string parola, string platform, string platformToken, string deviceId = "")

        {
            string ip = ContextObject.Current.Connection.RemoteIpAddress.ToString();
            string port = ContextObject.Current.Connection.RemotePort.ToString();
            string userAgent = ContextObject.Current.Request.Headers["User-Agent"].ToString();

            Kullanici kullanici = new Kullanici();

            Sql.GetInstance().Set("sp_kullanici_giris", new List<object> { kullaniciadi, parola, ip, port, userAgent, platform, platformToken, deviceId }, (ds) =>
            {
                if (ds.Tables.Count <= 0)
                    return;

                if (ds.Tables[0].Rows.Count <= 0)
                    return;

                if (!"SUCCEED".Equals(ds.Tables[0].Rows[0].GetString("Result")))
                    return;

                kullanici = Parse(ds.Tables[0].Rows[0]);

                if (ds.Tables.Count > 1)
                {
                    foreach (DataRow row in ds.Tables[1].Rows)
                        kullanici.Yetkiler.Add(Yetki.Parse(row));
                }

                if (Platform.WEB.ToLower().Equals(platform.ToLower()))
                {
                    string sessionId = string.IsNullOrEmpty(Config.Get("Logging:SessionId")) ? "LogId" : Config.Get("Logging:SessionId");

                    ContextObject.Current.Session.SetString("Kullanici", JsonConvert.SerializeObject(kullanici));
                    ContextObject.Current.Session.SetString(sessionId, kullanici.Id.ToString());
                }

                Sql.ResetInstance();
            });



            return kullanici;
        }

        public static string HesapSilme(string kullaniciToken)
        {
            return Sql.GetInstance().Get("sp_mobil_kullanici_sil", new List<object> {
                kullaniciToken
                }, (row) =>
                {
                    return row.GetString("Result");
                });
        }


        public static void Cikis()
        {
            ContextObject.Current.Session.Remove("Kullanici");
        }

        public static Kullanici Detay(int id)
        {
            return Sql.GetInstance().Get("sp_kullanici_detay", new List<object> { Oturum().Id, id }, (row) =>
            {
                return Parse(row);
            });
        }

        public static List<Kullanici> Listele()
        {
            return Sql.GetInstance().List("sp_kullanici_listesi", new List<object> { Oturum().Id }, (row) =>
            {
                return Parse(row);
            });
        }

        public static string Olustur(Kullanici param)
        {

            //if (Regex.IsMatch(param.Eposta, @"\A(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?)\Z", RegexOptions.IgnoreCase))
            //{
            if (string.IsNullOrEmpty(param.AdSoyad))
            {
                return "NO_USERNAME_SURNAME";
            }

            if (string.IsNullOrEmpty(param.Eposta))
            {
                return "NO_EMAIL";
            }

            if (string.IsNullOrEmpty(param.Parola))
            {
                return "NO_PASSWORD";
            }


            return Sql.GetInstance().Get("sp_kullanici_olustur", new List<object> {
                param.refKullaniciGrup,
                param.AdSoyad,
                param.Eposta,
                "0",
                param.Parola

                }, (row) =>
                {
                    return row.GetString("Result");
                });
            //}
            //else
            //{
            //    return "WRONG_EMAIL";
            //}

        }



        public static string Guncelle(Kullanici param)
        {
            return Sql.GetInstance().Get("sp_kullanici_guncelle", new List<object>
            {
                Oturum().Id,
                param.Id,
                param.AdSoyad,
                param.Eposta,
                param.Telefon,
                param.refKullaniciGrup
            }, (row) =>
            {
                return row.GetString("Result");
            });
        }

        public static string Sil(int id)
        {
            return Sql.GetInstance().Get("sp_kullanici_sil", new List<object> { Oturum().Id, id }, (row) =>
            {
                return row.GetString("Result");
            });
        }

        public static string TokenKontrol(string token)
        {
            return Sql.GetInstance().Get("sp_token_control", new List<object> { token }, (row) =>
            {
                return row.GetString("Result");
            });
        }
    }
}
