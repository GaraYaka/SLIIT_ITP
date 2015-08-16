using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(SLIIT.CORE.Startup))]
namespace SLIIT.CORE
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
