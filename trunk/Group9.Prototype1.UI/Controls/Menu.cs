using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group9.Prototype1.UI.Controls
{
    [ToolboxData("<{0}:Menu runat=server></{0}:Menu>")]
    public class Menu : WebControl
    {
        protected override void RenderContents(HtmlTextWriter output)
        {            
            foreach (SiteMapNode node in SiteMap.RootNode.ChildNodes)
            {
                bool access = false;
                foreach (string role in node.Roles)
                    if (Context.User.IsInRole(role))
                        access = true;

                if (access)
                {
                    if (SiteMap.CurrentNode != null && SiteMap.CurrentNode.Url == node.Url)
                    {
                        output.AddAttribute("class", "active");
                    }
                    output.RenderBeginTag("li");
                    output.WriteBeginTag("a");
                    output.WriteAttribute("href", node.Url);
                    output.WriteAttribute("title", node.Description);
                    output.Write(HtmlTextWriter.TagRightChar);
                    output.Write(node.Title);
                    output.WriteEndTag("a");

                    output.RenderEndTag();
                }
            }
        }
    }
}
