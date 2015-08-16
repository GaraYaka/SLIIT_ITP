using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(SLIIT.ITP.Startup))]
namespace SLIIT.ITP
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
