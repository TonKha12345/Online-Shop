using System.Web;
using System.Web.Optimization;

namespace TTK_Online
{
    public class BundleConfig
    {
        // For more information on bundling, visit https://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jscore").Include(
                        "~/Assets/Client/js/code.jquery.com_jquery-3.6.0.js",
                        "~/Assets/Client/js/code.jquery.com_ui_1.13.2_jquery-ui.js",
                        "~/Assets/Client/js/move-top.js",
                        "~/Assets/Client/js/easing.js",
                        "~/Assets/Client/js/startstop-slider.js"));

            bundles.Add(new ScriptBundle("~/bundles/jsbottom").Include(
                        "~/Assets/Client/js/Controller/SearchController.js"));

            bundles.Add(new StyleBundle("~/bundles/core").Include(
                      "~/Assets/Client/css/style.css",
                      "~/Assets/Client/css/slider.css",
                      "~//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css",
                      "~/resources/demos/style.css"));

            BundleTable.EnableOptimizations = true;
        }
    }
}
