#pragma checksum "C:\Users\MehmetYavuz\Desktop\TaskManager\TaskManager\TaskWeb\Views\Gorev\Index.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "51ae2b4eb4da01d5f9aada1a79ff7c2a608d597a"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_Gorev_Index), @"mvc.1.0.view", @"/Views/Gorev/Index.cshtml")]
[assembly:global::Microsoft.AspNetCore.Mvc.Razor.Compilation.RazorViewAttribute(@"/Views/Gorev/Index.cshtml", typeof(AspNetCore.Views_Gorev_Index))]
namespace AspNetCore
{
    #line hidden
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Threading.Tasks;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.AspNetCore.Mvc.Rendering;
    using Microsoft.AspNetCore.Mvc.ViewFeatures;
#line 1 "C:\Users\MehmetYavuz\Desktop\TaskManager\TaskManager\TaskWeb\Views\_ViewImports.cshtml"
using TaskWeb;

#line default
#line hidden
#line 2 "C:\Users\MehmetYavuz\Desktop\TaskManager\TaskManager\TaskWeb\Views\_ViewImports.cshtml"
using TaskCore.Model;

#line default
#line hidden
#line 3 "C:\Users\MehmetYavuz\Desktop\TaskManager\TaskManager\TaskWeb\Views\_ViewImports.cshtml"
using TaskWeb.Helper;

#line default
#line hidden
#line 4 "C:\Users\MehmetYavuz\Desktop\TaskManager\TaskManager\TaskWeb\Views\_ViewImports.cshtml"
using TaskCore.NetCore.UI.Models;

#line default
#line hidden
#line 5 "C:\Users\MehmetYavuz\Desktop\TaskManager\TaskManager\TaskWeb\Views\_ViewImports.cshtml"
using Microsoft.AspNetCore.Identity;

#line default
#line hidden
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"51ae2b4eb4da01d5f9aada1a79ff7c2a608d597a", @"/Views/Gorev/Index.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"8b0a51f91c3f07859d4e4287aa565734ce09f73c", @"/Views/_ViewImports.cshtml")]
    public class Views_Gorev_Index : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<dynamic>
    {
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_0 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("src", new global::Microsoft.AspNetCore.Html.HtmlString("~/lib_local/moment/moment.js"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        #line hidden
        #pragma warning disable 0169
        private string __tagHelperStringValueBuffer;
        #pragma warning restore 0169
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext __tagHelperExecutionContext;
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner __tagHelperRunner = new global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner();
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager __backed__tagHelperScopeManager = null;
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager __tagHelperScopeManager
        {
            get
            {
                if (__backed__tagHelperScopeManager == null)
                {
                    __backed__tagHelperScopeManager = new global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager(StartTagHelperWritingScope, EndTagHelperWritingScope);
                }
                return __backed__tagHelperScopeManager;
            }
        }
        private global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.UrlResolutionTagHelper __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper;
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
            BeginContext(0, 2, true);
            WriteLiteral("\r\n");
            EndContext();
#line 2 "C:\Users\MehmetYavuz\Desktop\TaskManager\TaskManager\TaskWeb\Views\Gorev\Index.cshtml"
  
    Layout = "_Layout";

#line default
#line hidden
            BeginContext(34, 816, true);
            WriteLiteral(@"
<div class=""content"">
    <div>
        <div class=""row"">
            <div class=""col-lg-12"">
                <div class=""hpanel"">
                    <div class=""panel-heading"">
                        <div class=""panel-tools"">
                            <a class=""showhide""><i class=""fa fa-chevron-up""></i></a>
                            <a class=""closebox""><i class=""fa fa-times""></i></a>
                        </div>
                        Görev Yöneticisi
                    </div>
                    <div class=""panel-body"">
                        <div id='calendar'></div>
                    </div>
                    <div class=""panel-footer"">
                      
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

");
            EndContext();
            BeginContext(850, 52, false);
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("script", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "51ae2b4eb4da01d5f9aada1a79ff7c2a608d597a5161", async() => {
            }
            );
            __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.UrlResolutionTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_0);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
            EndContext();
            BeginContext(902, 7399, true);
            WriteLiteral(@"

<script type=""text/javascript"">

    var resourceData;
    var eventData;
    var calendarEl;
    var calendar;

    $(document).ready(function () {
        GorevListesi();
    });


    function GorevListesi() {

        resourceData = null;
        eventData = null;

        Network.ajaxRequest({
            type: ""POST"",
            url: ""/Gorev/Listesi"",
            data: """",
            beforeSend: function () {
            },
            success: function (data) {
                console.log(data.Result);

                resourceData = data.Result.Resource;
                eventData = data.Result.Event;

                calendarEl = document.getElementById('calendar');

                if (calendar != null) {
                    calendar.destroy();
                }

                var currentView = ""resourceTimelineDay"";
                calendar = new FullCalendar.Calendar(calendarEl, {
                    schedulerLicenseKey: '0613983340-fcs-1579172423',
   ");
            WriteLiteral(@"                 locale: 'tr',
                    contentHeight: 600,
                    initialView: 'resourceTimelineDay',
                    plugins: ['interaction', 'dayGrid', 'timeGrid', 'resourceTimeline'],
                    editable: true,
                    aspectRatio: 1.8,
                    header: {
                        left: 'prev,next',
                        center: 'title',
                        right: 'resourceTimelineDay,resourceTimelineWeek,resourceTimelineMonth'
                    },
                    displayEventTime: true,
                    weekNumbers: true,
                    eventRender: function (info) {

                        if (!info.isMirror) {
                            $(info.el).tooltip({ html: true, title: info.event.extendedProps.description });
                            //console.log(info.event.extendedProps.description);
                        }
                    },
                    eventAfterAllRender: function (view) {
 ");
            WriteLiteral(@"                       
                        $date = $('.fc-widget-header[data-date=\'' + (new Date()) + '\']', view.calendar.el);
                        //$date = $('.fc-today', view.calendar.el);

                        $scroller = $('.fc-time-area > div > .fc-scroller', view.calendar.el);

                        $('.fc-scroller').scrollLeft($date.position().left);

                    },
                    eventClick: function (info) {

                  
                        window.location.href = ""/Gorev/Detay?Id="" + info.event.id+"""";
                    },
                    defaultView: currentView,
                    views: {
                        resourceTimelineDay: {
                            type: 'resourceTimeline',
                            duration: { days: 1 },
                            buttonText: 'Günlük'
                        },
                        resourceTimelineWeek: {
                            type: 'resourceTimeline',
                 ");
            WriteLiteral(@"           duration: { days: 7 },
                            buttonText: 'Haftalık'
                        },
                        resourceTimelineMonth: {
                            type: 'resourceTimeline',
                            duration: { days: 31 },
                            buttonText: 'Aylık'
                        }
                    },
                    nowIndicator: true,
                    resourceAreaWidth: '15%',
                    resourceColumns: [
                        {
                            labelText: 'Kullanıcı',
                            field: 'AdSoyad'
                        },
                    ],
                    eventOverlap: false,
                    resources: resourceData,
                    events: eventData,
                });

                calendar.render();

            },
            error: function (a, b, c) {

            },
            complete: function () {
            }
        });

    }
</scrip");
            WriteLiteral(@"t>

<style>


    p {
        text-align: center;
    }

    .fc-resource-area tr:hover {
        cursor: pointer;
        background: #FFC107;
    }

    .fc-content tr:hover {
        background: #FFC107;
        /*opacity: 0.4;*/
        cursor: pointer
    }

    .popper,
    .tooltip {
        position: absolute;
        z-index: 9999999999999999999;
        background: #FFC107;
        color: black;
        width: 150px;
        border-radius: 3px;
        /*box-shadow: 0 0 2px rgba(0,0,0,0.5);*/
        /*padding: 10px;*/
        text-align: center;
    }

    .style5 .tooltip {
        background: #1E252B;
        color: #FFFFFF;
        max-width: 250px;
        width: auto;
        font-size: .8rem;
        padding: .5em 1em;
    }

    .popper .popper__arrow,
    .tooltip .tooltip-arrow {
        width: 0;
        height: 0;
        border-style: solid;
        position: absolute;
        margin: 5px;
    }

    .tooltip .tooltip-arrow,
    .poppe");
            WriteLiteral(@"r .popper__arrow {
        border-color: #FFC107;
    }

    .style5 .tooltip .tooltip-arrow {
        border-color: #1E252B;
    }

    .popper[x-placement^=""top""],
    .tooltip[x-placement^=""top""] {
        margin-bottom: 5px;
    }

        .popper[x-placement^=""top""] .popper__arrow,
        .tooltip[x-placement^=""top""] .tooltip-arrow {
            border-width: 5px 5px 0 5px;
            border-left-color: transparent;
            border-right-color: transparent;
            border-bottom-color: transparent;
            bottom: -5px;
            left: calc(50% - 5px);
            margin-top: 0;
            margin-bottom: 0;
        }

    .popper[x-placement^=""bottom""],
    .tooltip[x-placement^=""bottom""] {
        margin-top: 5px;
    }

        .tooltip[x-placement^=""bottom""] .tooltip-arrow,
        .popper[x-placement^=""bottom""] .popper__arrow {
            border-width: 0 5px 5px 5px;
            border-left-color: transparent;
            border-right-color: transpar");
            WriteLiteral(@"ent;
            border-top-color: transparent;
            top: -5px;
            left: calc(50% - 5px);
            margin-top: 0;
            margin-bottom: 0;
        }

    .tooltip[x-placement^=""right""],
    .popper[x-placement^=""right""] {
        margin-left: 5px;
    }

        .popper[x-placement^=""right""] .popper__arrow,
        .tooltip[x-placement^=""right""] .tooltip-arrow {
            border-width: 5px 5px 5px 0;
            border-left-color: transparent;
            border-top-color: transparent;
            border-bottom-color: transparent;
            left: -5px;
            top: calc(50% - 5px);
            margin-left: 0;
            margin-right: 0;
        }

    .popper[x-placement^=""left""],
    .tooltip[x-placement^=""left""] {
        margin-right: 5px;
    }

        .popper[x-placement^=""left""] .popper__arrow,
        .tooltip[x-placement^=""left""] .tooltip-arrow {
            border-width: 5px 0 5px 5px;
            border-top-color: transparent;
     ");
            WriteLiteral("       border-right-color: transparent;\r\n            border-bottom-color: transparent;\r\n            right: -5px;\r\n            top: calc(50% - 5px);\r\n            margin-left: 0;\r\n            margin-right: 0;\r\n        }\r\n</style>\r\n\r\n");
            EndContext();
        }
        #pragma warning restore 1998
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.ViewFeatures.IModelExpressionProvider ModelExpressionProvider { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IUrlHelper Url { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IViewComponentHelper Component { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IJsonHelper Json { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<dynamic> Html { get; private set; }
    }
}
#pragma warning restore 1591
