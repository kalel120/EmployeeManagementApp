using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(HTMLHelperAnnotationApp.Startup))]
namespace HTMLHelperAnnotationApp {
    public class Startup {
        public void Configuration(IAppBuilder app) {
        }
    }
}
