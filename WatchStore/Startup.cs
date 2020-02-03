using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.Owin;
using Microsoft.Owin.Cors;
using Microsoft.Owin.Security.OAuth;
using Owin;
using WatchStore.Providers;

[assembly: OwinStartup(typeof(WatchStore.Startup))]

namespace WatchStore
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
            //app.UseCors(CorsOptions.AllowAll);

            //OAuthAuthorizationServerOptions option = new OAuthAuthorizationServerOptions
            //{
            //    TokenEndpointPath = new PathString("/token"),
            //    Provider = new ApplicationOAuthProvider(),
            //    AccessTokenExpireTimeSpan = TimeSpan.FromMinutes(60),
            //    AllowInsecureHttp = true
            //};
            //app.UseOAuthAuthorizationServer(option);
            //app.UseOAuthBearerAuthentication(new OAuthBearerAuthenticationOptions());
        }
    }
}
