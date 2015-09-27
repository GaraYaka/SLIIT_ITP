using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading;

namespace SLIIT.Core.BL
{
    public partial class SendMailBL
    {

        public static void SendHTMLBodyMail(string[] to, string subject, string body, string fromName, int instanceId)
        {
            if ((to != null) && (to.Length != 0))
            {

                string sMTPServer;
                bool sMTPAuth;
                string sMTPUser;
                string sMTPPassword;
                int sMTPPort;
                bool sMTPUseSSL;
                string fromAddress;
                subject = subject.Replace(Environment.NewLine, " ");
                subject = Regex.Replace(subject, "[^ -~]", "");
                string replyto = null;
                // instanceId = 0;

                var appSetting = new SettingBL().GetSettings();

                sMTPServer = appSetting.SMTPServer;
                sMTPAuth = appSetting.SMTPAuthRequired;
                sMTPUser = appSetting.SMTPUserName;
                sMTPPassword = appSetting.SMTPPassword;
                sMTPPort = appSetting.SMTPPort;
                sMTPUseSSL = appSetting.SMTPUseSSL;
                fromAddress = appSetting.FromAddress;

                replyto = appSetting.ReplyToAddress;

                new AsyncSendMail(sMTPServer, sMTPAuth, sMTPUser, sMTPPassword, sMTPPort, sMTPUseSSL, to, fromAddress, fromName, subject, body, replyto).SendAsynchronously();
            }
        }

        public static void Send(string[] to, string subject, string body, string fromName)
        {
            if ((to != null) && (to.Length != 0))
            {

                string sMTPServer;
                bool sMTPAuth;
                string sMTPUser;
                string sMTPPassword;
                int sMTPPort;
                bool sMTPUseSSL;
                string fromAddress;
                subject = subject.Replace(Environment.NewLine, " ");
                subject = Regex.Replace(subject, "[^ -~]", "");
                string replyto = null;

                var appSetting = new SettingBL().GetSettings();

                sMTPServer = appSetting.SMTPServer;
                sMTPAuth = appSetting.SMTPAuthRequired;
                sMTPUser = appSetting.SMTPUserName;
                sMTPPassword = appSetting.SMTPPassword;
                sMTPPort = appSetting.SMTPPort;
                sMTPUseSSL = appSetting.SMTPUseSSL;
                fromAddress = appSetting.FromAddress;

                replyto = appSetting.ReplyToAddress;
                new AsyncSendMail(sMTPServer, sMTPAuth, sMTPUser, sMTPPassword, sMTPPort, sMTPUseSSL, to, fromAddress, fromName, subject, body, replyto).SendAsynchronously();
            }

        }

        public static void Send(string to, string subject, string body, string fromName)
        {
            if ((to != null) && (to.Length != 0))
            {
                string sMTPServer;
                bool sMTPAuth;
                string sMTPUser;
                string sMTPPassword;
                int sMTPPort;
                bool sMTPUseSSL;
                string fromAddress;
                subject = subject.Replace(Environment.NewLine, " ");
                subject = Regex.Replace(subject, "[^ -~]", "");
                string replyto = null;

                string[] toMail = new string[1];
                toMail[0] = to;

                var appSetting = new SettingBL().GetSettings();

                sMTPServer = appSetting.SMTPServer;
                sMTPAuth = appSetting.SMTPAuthRequired;
                sMTPUser = appSetting.SMTPUserName;
                sMTPPassword = appSetting.SMTPPassword;
                sMTPPort = appSetting.SMTPPort;
                sMTPUseSSL = appSetting.SMTPUseSSL;
                fromAddress = appSetting.FromAddress;

                replyto = appSetting.ReplyToAddress;
                new AsyncSendMail(sMTPServer, sMTPAuth, sMTPUser, sMTPPassword, sMTPPort, sMTPUseSSL, toMail, fromAddress, fromName, subject, body, replyto).SendAsynchronously();

            }

        }

        public static void Send_mod(string to, string subject, string body, string fromName, string fromaddr)
        {
            if ((to != null) && (to.Length != 0))
            {
                string sMTPServer;
                bool sMTPAuth;
                string sMTPUser;
                string sMTPPassword;
                int sMTPPort;
                bool sMTPUseSSL;
                string fromAddress;
                subject = subject.Replace(Environment.NewLine, " ");
                subject = Regex.Replace(subject, "[^ -~]", "");
                string replyto = null;

                string[] toMail = new string[1];
                toMail[0] = to;

                var appSetting = new SettingBL().GetSettings();

                sMTPServer = appSetting.SMTPServer;
                sMTPAuth = appSetting.SMTPAuthRequired;
                sMTPUser = appSetting.SMTPUserName;
                sMTPPassword = appSetting.SMTPPassword;
                sMTPPort = appSetting.SMTPPort;
                sMTPUseSSL = appSetting.SMTPUseSSL;
                fromAddress = fromaddr;

                replyto = appSetting.ReplyToAddress;
                new AsyncSendMail(sMTPServer, sMTPAuth, sMTPUser, sMTPPassword, sMTPPort, sMTPUseSSL, toMail, fromAddress, fromName, subject, body, replyto).SendAsynchronously(); ;

            }

        }

        // Nested Types
        public class AsyncSendMail
        {
            // Fields
            private string _body;
            private string _from;
            private string _fromName;
            private string[] _recipients;
            private string _replyto;
            private bool _smtpAuthentication;
            private string _smtpLogin;
            private string _smtpPassword;
            private int _smtpPort;
            private string _smtpServerAddress;
            private bool _smtpUseSSL;
            private string _subject;
            private List<Attachment> _attachment;

            public void SendHTMLMail()
            {
                this.SendAsynchronously();
            }


            // Methods
            public AsyncSendMail(string smtpServerAddress, bool smtpAuthentication, string smtpLogin, string smtpPassword, int smtpPort, bool smtpUseSSL, string[] recipients, string from, string fromName, string subject, string body, string replyto)
            {
                this._smtpServerAddress = smtpServerAddress;
                this._smtpAuthentication = smtpAuthentication;
                this._smtpLogin = smtpLogin;
                this._smtpPassword = smtpPassword;
                this._smtpUseSSL = smtpUseSSL;
                this._recipients = recipients;
                this._subject = subject;
                this._from = from;
                this._fromName = fromName;
                this._body = body;
                this._smtpPort = smtpPort;
                this._replyto = replyto;

            }

            // Methods
            public AsyncSendMail(string smtpServerAddress, bool smtpAuthentication, string smtpLogin, string smtpPassword, int smtpPort, bool smtpUseSSL, string[] recipients, string from,
                string fromName, string subject, string body, string replyto, List<Attachment> att)
            {
                this._smtpServerAddress = smtpServerAddress;
                this._smtpAuthentication = smtpAuthentication;
                this._smtpLogin = smtpLogin;
                this._smtpPassword = smtpPassword;
                this._smtpUseSSL = smtpUseSSL;
                this._recipients = recipients;
                this._subject = subject;
                this._from = from;
                this._fromName = fromName;
                this._body = body;
                this._smtpPort = smtpPort;
                this._replyto = replyto;
                this._attachment = att;
            }

            public void SendAsynchronously()
            {
                //mail sending disabled for testing
                ThreadStart start = new ThreadStart(this.SendThreadProc);
                Thread thread = new Thread(start);
                thread.Priority = ThreadPriority.Normal;
                thread.Start();
            }

            private void SendEmails()
            {
                MailAddress from = null;
                try
                {
                    if (this._fromName == null)
                    {
                        from = new MailAddress(this._from);
                    }
                    else
                    {
                        from = new MailAddress(this._from, this._fromName);
                    }
                }
                catch
                {
                    return;
                }

                MailMessage message = new MailMessage();
                message.From = from;

                try
                {
                    if (_attachment != null && _attachment.Count > 0)
                    {
                        foreach (var item in _attachment)
                        {
                            message.Attachments.Add(item);
                        }

                    }
                }
                catch (Exception ex)
                {

                }


                foreach (string str in this._recipients)
                {
                    if (str.Trim().Length != 0)
                    {
                        message.To.Add(new MailAddress(str));

                        //MailAddress address2;
                        //try
                        //{
                        //    address2 = new MailAddress(str);
                        //}
                        //catch
                        //{
                        //    goto Label_011A;
                        //}
                    }
                }

                if (message.To.Count > 0)
                {
                    message.Subject = this._subject;
                    message.Body = this._body;
                    if ((this._replyto != null) && (this._replyto.Trim().Length > 0))
                    {
                        try
                        {
                            MailAddress address3 = new MailAddress(this._replyto);
                            message.ReplyTo = address3;
                        }
                        catch
                        {
                        }
                    }
                    message.IsBodyHtml = true;
                    SmtpClient client = new SmtpClient();
                    client.Port = this._smtpPort;
                    client.Host = this._smtpServerAddress;
                    client.DeliveryMethod = SmtpDeliveryMethod.Network;
                    client.EnableSsl = this._smtpUseSSL;
                    if (this._smtpAuthentication)
                    {
                        client.Credentials = new NetworkCredential(this._smtpLogin, this._smtpPassword);
                    }
                    client.Send(message);
                }
                else
                {

                }

            }

            public void SendSynchronously()
            {
                this.SendEmails();
            }

            private void SendThreadProc()
            {
                try
                {
                    this.SendEmails();
                }
                catch (Exception exception)
                {
                    //ExceptionHandler.LogException("Error sending email", exception);
                    // ExceptionHandler.SendErrorReport(exception);
                }
            }
        }


        public static void Send(string to, string subject, string body, string fromName, List<Attachment> att)
        {
            if ((to != null) && (to.Length != 0))
            {
                string sMTPServer;
                bool sMTPAuth;
                string sMTPUser;
                string sMTPPassword;
                int sMTPPort;
                bool sMTPUseSSL;
                string fromAddress;
                subject = subject.Replace(Environment.NewLine, " ");
                subject = Regex.Replace(subject, "[^ -~]", "");
                string replyto = null;

                string[] toMail = new string[1];
                toMail[0] = to;

                var appSetting = new SettingBL().GetSettings();

                sMTPServer = appSetting.SMTPServer;
                sMTPAuth = appSetting.SMTPAuthRequired;
                sMTPUser = appSetting.SMTPUserName;
                sMTPPassword = appSetting.SMTPPassword;
                sMTPPort = appSetting.SMTPPort;
                sMTPUseSSL = appSetting.SMTPUseSSL;
                fromAddress = appSetting.FromAddress;

                replyto = appSetting.ReplyToAddress;
                new AsyncSendMail(sMTPServer, sMTPAuth, sMTPUser, sMTPPassword, sMTPPort, sMTPUseSSL, toMail, fromAddress, fromName, subject, body, replyto, att).SendAsynchronously(); ;

            }

        }
    }

}
