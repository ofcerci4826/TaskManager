#pragma checksum "D:\GithubProjeler\TaskManager\TaskWeb\Views\Gorev\Detay.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "2f7c952c37b8b8d9bac870814338ab8c2dcd9e3f"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_Gorev_Detay), @"mvc.1.0.view", @"/Views/Gorev/Detay.cshtml")]
[assembly:global::Microsoft.AspNetCore.Mvc.Razor.Compilation.RazorViewAttribute(@"/Views/Gorev/Detay.cshtml", typeof(AspNetCore.Views_Gorev_Detay))]
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
#line 1 "D:\GithubProjeler\TaskManager\TaskWeb\Views\_ViewImports.cshtml"
using TaskWeb;

#line default
#line hidden
#line 2 "D:\GithubProjeler\TaskManager\TaskWeb\Views\_ViewImports.cshtml"
using TaskCore.Model;

#line default
#line hidden
#line 3 "D:\GithubProjeler\TaskManager\TaskWeb\Views\_ViewImports.cshtml"
using TaskWeb.Helper;

#line default
#line hidden
#line 4 "D:\GithubProjeler\TaskManager\TaskWeb\Views\_ViewImports.cshtml"
using TaskCore.NetCore.UI.Models;

#line default
#line hidden
#line 5 "D:\GithubProjeler\TaskManager\TaskWeb\Views\_ViewImports.cshtml"
using Microsoft.AspNetCore.Identity;

#line default
#line hidden
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"2f7c952c37b8b8d9bac870814338ab8c2dcd9e3f", @"/Views/Gorev/Detay.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"8b0a51f91c3f07859d4e4287aa565734ce09f73c", @"/Views/_ViewImports.cshtml")]
    public class Views_Gorev_Detay : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<GorevEvent>
    {
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_0 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("value", "0", global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_1 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("method", "post", global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_2 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("data-reset", new global::Microsoft.AspNetCore.Html.HtmlString("true"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_3 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("id", new global::Microsoft.AspNetCore.Html.HtmlString("gorevGuncelleForm"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_4 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("class", new global::Microsoft.AspNetCore.Html.HtmlString("form-horizontal form-submit"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
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
        private global::Microsoft.AspNetCore.Mvc.TagHelpers.FormTagHelper __Microsoft_AspNetCore_Mvc_TagHelpers_FormTagHelper;
        private global::Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper __Microsoft_AspNetCore_Mvc_TagHelpers_RenderAtEndOfFormTagHelper;
        private global::Microsoft.AspNetCore.Mvc.TagHelpers.OptionTagHelper __Microsoft_AspNetCore_Mvc_TagHelpers_OptionTagHelper;
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
#line 2 "D:\GithubProjeler\TaskManager\TaskWeb\Views\Gorev\Detay.cshtml"
  
    ViewData["Title"] = "Detay";
    Layout = "~/Views/Shared/_Layout.cshtml";

#line default
#line hidden
            BeginContext(107, 608, true);
            WriteLiteral(@"

<div class=""content"">
    <div>
        <div class=""row"">
            <div class=""col-lg-6"">
                <div class=""hpanel"">
                    <div class=""panel-heading"">
                        <div class=""panel-tools"">
                            <a class=""showhide""><i class=""fa fa-chevron-up""></i></a>
                            <a class=""closebox""><i class=""fa fa-times""></i></a>
                        </div>
                        Görev Detay
                    </div>
                    <div class=""panel-body"">
                        <input type=""hidden"" id=""returnUrl""");
            EndContext();
            BeginWriteAttribute("value", " value=\"", 715, "\"", 752, 1);
#line 21 "D:\GithubProjeler\TaskManager\TaskWeb\Views\Gorev\Detay.cshtml"
WriteAttributeValue("", 723, Url.Action("Index", "Gorev"), 723, 29, false);

#line default
#line hidden
            EndWriteAttribute();
            BeginContext(753, 29, true);
            WriteLiteral(" />\r\n                        ");
            EndContext();
            BeginContext(782, 5552, false);
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("form", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "2f7c952c37b8b8d9bac870814338ab8c2dcd9e3f6724", async() => {
                BeginContext(921, 62, true);
                WriteLiteral("\r\n\r\n                            <input type=\"hidden\" name=\"id\"");
                EndContext();
                BeginWriteAttribute("value", " value=\"", 983, "\"", 1000, 1);
#line 24 "D:\GithubProjeler\TaskManager\TaskWeb\Views\Gorev\Detay.cshtml"
WriteAttributeValue("", 991, Model.id, 991, 9, false);

#line default
#line hidden
                EndWriteAttribute();
                BeginContext(1001, 357, true);
                WriteLiteral(@" />

                            <div class=""form-group"">
                                <label class=""col-sm-4 control-label""> Kullanıcı</label>
                                <div class=""col-sm-8"">
                                    <select class=""selectKullanici"" style=""width: 100%"" name=""refKullanici"">
                                        ");
                EndContext();
                BeginContext(1358, 47, false);
                __tagHelperExecutionContext = __tagHelperScopeManager.Begin("option", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "2f7c952c37b8b8d9bac870814338ab8c2dcd9e3f7937", async() => {
                    BeginContext(1376, 20, true);
                    WriteLiteral(" Kullanıcı Seçiniz  ");
                    EndContext();
                }
                );
                __Microsoft_AspNetCore_Mvc_TagHelpers_OptionTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.TagHelpers.OptionTagHelper>();
                __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_TagHelpers_OptionTagHelper);
                __Microsoft_AspNetCore_Mvc_TagHelpers_OptionTagHelper.Value = (string)__tagHelperAttribute_0.Value;
                __tagHelperExecutionContext.AddTagHelperAttribute(__tagHelperAttribute_0);
                await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
                if (!__tagHelperExecutionContext.Output.IsContentModified)
                {
                    await __tagHelperExecutionContext.SetOutputContentAsync();
                }
                Write(__tagHelperExecutionContext.Output);
                __tagHelperExecutionContext = __tagHelperScopeManager.End();
                EndContext();
                BeginContext(1405, 2, true);
                WriteLiteral("\r\n");
                EndContext();
#line 31 "D:\GithubProjeler\TaskManager\TaskWeb\Views\Gorev\Detay.cshtml"
                                         foreach (var item in Kullanici.Listele())
                                        {
                                            if (Model.refKullanici == item.Id)
                                            {

#line default
#line hidden
                BeginContext(1661, 48, true);
                WriteLiteral("                                                ");
                EndContext();
                BeginContext(1709, 60, false);
                __tagHelperExecutionContext = __tagHelperScopeManager.Begin("option", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "2f7c952c37b8b8d9bac870814338ab8c2dcd9e3f9937", async() => {
                    BeginContext(1743, 2, true);
                    WriteLiteral("  ");
                    EndContext();
                    BeginContext(1746, 12, false);
#line 35 "D:\GithubProjeler\TaskManager\TaskWeb\Views\Gorev\Detay.cshtml"
                                                                               Write(item.AdSoyad);

#line default
#line hidden
                    EndContext();
                    BeginContext(1758, 2, true);
                    WriteLiteral("  ");
                    EndContext();
                }
                );
                __Microsoft_AspNetCore_Mvc_TagHelpers_OptionTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.TagHelpers.OptionTagHelper>();
                __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_TagHelpers_OptionTagHelper);
                BeginWriteTagHelperAttribute();
                __tagHelperStringValueBuffer = EndWriteTagHelperAttribute();
                __tagHelperExecutionContext.AddHtmlAttribute("selected", Html.Raw(__tagHelperStringValueBuffer), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.Minimized);
                BeginWriteTagHelperAttribute();
#line 35 "D:\GithubProjeler\TaskManager\TaskWeb\Views\Gorev\Detay.cshtml"
                                                            WriteLiteral(item.Id);

#line default
#line hidden
                __tagHelperStringValueBuffer = EndWriteTagHelperAttribute();
                __Microsoft_AspNetCore_Mvc_TagHelpers_OptionTagHelper.Value = __tagHelperStringValueBuffer;
                __tagHelperExecutionContext.AddTagHelperAttribute("value", __Microsoft_AspNetCore_Mvc_TagHelpers_OptionTagHelper.Value, global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
                await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
                if (!__tagHelperExecutionContext.Output.IsContentModified)
                {
                    await __tagHelperExecutionContext.SetOutputContentAsync();
                }
                Write(__tagHelperExecutionContext.Output);
                __tagHelperExecutionContext = __tagHelperScopeManager.End();
                EndContext();
                BeginContext(1769, 2, true);
                WriteLiteral("\r\n");
                EndContext();
#line 36 "D:\GithubProjeler\TaskManager\TaskWeb\Views\Gorev\Detay.cshtml"
                                            }
                                            else
                                            {

#line default
#line hidden
                BeginContext(1915, 48, true);
                WriteLiteral("                                                ");
                EndContext();
                BeginContext(1963, 51, false);
                __tagHelperExecutionContext = __tagHelperScopeManager.Begin("option", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "2f7c952c37b8b8d9bac870814338ab8c2dcd9e3f12990", async() => {
                    BeginContext(1988, 2, true);
                    WriteLiteral("  ");
                    EndContext();
                    BeginContext(1991, 12, false);
#line 39 "D:\GithubProjeler\TaskManager\TaskWeb\Views\Gorev\Detay.cshtml"
                                                                      Write(item.AdSoyad);

#line default
#line hidden
                    EndContext();
                    BeginContext(2003, 2, true);
                    WriteLiteral("  ");
                    EndContext();
                }
                );
                __Microsoft_AspNetCore_Mvc_TagHelpers_OptionTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.TagHelpers.OptionTagHelper>();
                __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_TagHelpers_OptionTagHelper);
                BeginWriteTagHelperAttribute();
#line 39 "D:\GithubProjeler\TaskManager\TaskWeb\Views\Gorev\Detay.cshtml"
                                                   WriteLiteral(item.Id);

#line default
#line hidden
                __tagHelperStringValueBuffer = EndWriteTagHelperAttribute();
                __Microsoft_AspNetCore_Mvc_TagHelpers_OptionTagHelper.Value = __tagHelperStringValueBuffer;
                __tagHelperExecutionContext.AddTagHelperAttribute("value", __Microsoft_AspNetCore_Mvc_TagHelpers_OptionTagHelper.Value, global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
                await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
                if (!__tagHelperExecutionContext.Output.IsContentModified)
                {
                    await __tagHelperExecutionContext.SetOutputContentAsync();
                }
                Write(__tagHelperExecutionContext.Output);
                __tagHelperExecutionContext = __tagHelperScopeManager.End();
                EndContext();
                BeginContext(2014, 2, true);
                WriteLiteral("\r\n");
                EndContext();
#line 40 "D:\GithubProjeler\TaskManager\TaskWeb\Views\Gorev\Detay.cshtml"
                                            }

                                        }

#line default
#line hidden
                BeginContext(2108, 526, true);
                WriteLiteral(@"                                    </select>
                                    <span class=""help-block m-b-none""> <i>Görev sahibini seçiniz.</i></span>
                                </div>
                            </div>

                            <div class=""form-group"">
                                <label class=""col-sm-4 control-label""> Görev Ad</label>

                                <div class=""col-sm-8"">
                                    <input type=""text"" class=""form-control"" name=""GorevAd""");
                EndContext();
                BeginWriteAttribute("value", " value=\"", 2634, "\"", 2656, 1);
#line 52 "D:\GithubProjeler\TaskManager\TaskWeb\Views\Gorev\Detay.cshtml"
WriteAttributeValue("", 2642, Model.GorevAd, 2642, 14, false);

#line default
#line hidden
                EndWriteAttribute();
                BeginContext(2657, 667, true);
                WriteLiteral(@">
                                </div>
                            </div>


                            <div class=""form-group"">
                                <label class=""col-sm-4 control-label""> Baslangıç</label>

                                <div class=""col-sm-8"">
                                    <div class=""input-group date"" id=""dtBaslangic"">
                                        <span class=""input-group-addon"">
                                            <span class=""fa fa-calendar""></span>
                                        </span>
                                        <input type=""text"" class=""form-control"" name=""start""");
                EndContext();
                BeginWriteAttribute("value", " value=\"", 3324, "\"", 3344, 1);
#line 65 "D:\GithubProjeler\TaskManager\TaskWeb\Views\Gorev\Detay.cshtml"
WriteAttributeValue("", 3332, Model.start, 3332, 12, false);

#line default
#line hidden
                EndWriteAttribute();
                BeginContext(3345, 699, true);
                WriteLiteral(@">
                                    </div>
                                </div>
                            </div>

                            <div class=""form-group"">
                                <label class=""col-sm-4 control-label""> Bitiş</label>

                                <div class=""col-sm-8"">
                                    <div class=""input-group date"" id=""dtBitis"">
                                        <span class=""input-group-addon"">
                                            <span class=""fa fa-calendar""></span>
                                        </span>
                                        <input type=""text"" class=""form-control"" name=""end""");
                EndContext();
                BeginWriteAttribute("value", " value=\"", 4044, "\"", 4062, 1);
#line 78 "D:\GithubProjeler\TaskManager\TaskWeb\Views\Gorev\Detay.cshtml"
WriteAttributeValue("", 4052, Model.end, 4052, 10, false);

#line default
#line hidden
                EndWriteAttribute();
                BeginContext(4063, 474, true);
                WriteLiteral(@">
                                    </div>
                                </div>
                            </div>

                            <div class=""form-group"">
                                <label class=""col-sm-4 control-label""> Görev Durum</label>
                                <div class=""col-sm-8"">
                                    <select class=""selectGorevDurum"" style=""width: 100%"" name=""refDurum"">
                                        ");
                EndContext();
                BeginContext(4537, 50, false);
                __tagHelperExecutionContext = __tagHelperScopeManager.Begin("option", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "2f7c952c37b8b8d9bac870814338ab8c2dcd9e3f19243", async() => {
                    BeginContext(4555, 23, true);
                    WriteLiteral(" Görev Durumu Seçiniz  ");
                    EndContext();
                }
                );
                __Microsoft_AspNetCore_Mvc_TagHelpers_OptionTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.TagHelpers.OptionTagHelper>();
                __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_TagHelpers_OptionTagHelper);
                __Microsoft_AspNetCore_Mvc_TagHelpers_OptionTagHelper.Value = (string)__tagHelperAttribute_0.Value;
                __tagHelperExecutionContext.AddTagHelperAttribute(__tagHelperAttribute_0);
                await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
                if (!__tagHelperExecutionContext.Output.IsContentModified)
                {
                    await __tagHelperExecutionContext.SetOutputContentAsync();
                }
                Write(__tagHelperExecutionContext.Output);
                __tagHelperExecutionContext = __tagHelperScopeManager.End();
                EndContext();
                BeginContext(4587, 2, true);
                WriteLiteral("\r\n");
                EndContext();
#line 88 "D:\GithubProjeler\TaskManager\TaskWeb\Views\Gorev\Detay.cshtml"
                                         foreach (var item in GorevDurum.Listele())
                                        {
                                            if (Model.refDurum == item.Id)
                                            {

#line default
#line hidden
                BeginContext(4840, 48, true);
                WriteLiteral("                                                ");
                EndContext();
                BeginContext(4888, 58, false);
                __tagHelperExecutionContext = __tagHelperScopeManager.Begin("option", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "2f7c952c37b8b8d9bac870814338ab8c2dcd9e3f21244", async() => {
                    BeginContext(4922, 2, true);
                    WriteLiteral("  ");
                    EndContext();
                    BeginContext(4925, 10, false);
#line 92 "D:\GithubProjeler\TaskManager\TaskWeb\Views\Gorev\Detay.cshtml"
                                                                               Write(item.Durum);

#line default
#line hidden
                    EndContext();
                    BeginContext(4935, 2, true);
                    WriteLiteral("  ");
                    EndContext();
                }
                );
                __Microsoft_AspNetCore_Mvc_TagHelpers_OptionTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.TagHelpers.OptionTagHelper>();
                __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_TagHelpers_OptionTagHelper);
                BeginWriteTagHelperAttribute();
                __tagHelperStringValueBuffer = EndWriteTagHelperAttribute();
                __tagHelperExecutionContext.AddHtmlAttribute("selected", Html.Raw(__tagHelperStringValueBuffer), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.Minimized);
                BeginWriteTagHelperAttribute();
#line 92 "D:\GithubProjeler\TaskManager\TaskWeb\Views\Gorev\Detay.cshtml"
                                                            WriteLiteral(item.Id);

#line default
#line hidden
                __tagHelperStringValueBuffer = EndWriteTagHelperAttribute();
                __Microsoft_AspNetCore_Mvc_TagHelpers_OptionTagHelper.Value = __tagHelperStringValueBuffer;
                __tagHelperExecutionContext.AddTagHelperAttribute("value", __Microsoft_AspNetCore_Mvc_TagHelpers_OptionTagHelper.Value, global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
                await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
                if (!__tagHelperExecutionContext.Output.IsContentModified)
                {
                    await __tagHelperExecutionContext.SetOutputContentAsync();
                }
                Write(__tagHelperExecutionContext.Output);
                __tagHelperExecutionContext = __tagHelperScopeManager.End();
                EndContext();
                BeginContext(4946, 2, true);
                WriteLiteral("\r\n");
                EndContext();
#line 93 "D:\GithubProjeler\TaskManager\TaskWeb\Views\Gorev\Detay.cshtml"
                                            }
                                            else
                                            {

#line default
#line hidden
                BeginContext(5092, 48, true);
                WriteLiteral("                                                ");
                EndContext();
                BeginContext(5140, 49, false);
                __tagHelperExecutionContext = __tagHelperScopeManager.Begin("option", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "2f7c952c37b8b8d9bac870814338ab8c2dcd9e3f24296", async() => {
                    BeginContext(5165, 2, true);
                    WriteLiteral("  ");
                    EndContext();
                    BeginContext(5168, 10, false);
#line 96 "D:\GithubProjeler\TaskManager\TaskWeb\Views\Gorev\Detay.cshtml"
                                                                      Write(item.Durum);

#line default
#line hidden
                    EndContext();
                    BeginContext(5178, 2, true);
                    WriteLiteral("  ");
                    EndContext();
                }
                );
                __Microsoft_AspNetCore_Mvc_TagHelpers_OptionTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.TagHelpers.OptionTagHelper>();
                __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_TagHelpers_OptionTagHelper);
                BeginWriteTagHelperAttribute();
#line 96 "D:\GithubProjeler\TaskManager\TaskWeb\Views\Gorev\Detay.cshtml"
                                                   WriteLiteral(item.Id);

#line default
#line hidden
                __tagHelperStringValueBuffer = EndWriteTagHelperAttribute();
                __Microsoft_AspNetCore_Mvc_TagHelpers_OptionTagHelper.Value = __tagHelperStringValueBuffer;
                __tagHelperExecutionContext.AddTagHelperAttribute("value", __Microsoft_AspNetCore_Mvc_TagHelpers_OptionTagHelper.Value, global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
                await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
                if (!__tagHelperExecutionContext.Output.IsContentModified)
                {
                    await __tagHelperExecutionContext.SetOutputContentAsync();
                }
                Write(__tagHelperExecutionContext.Output);
                __tagHelperExecutionContext = __tagHelperScopeManager.End();
                EndContext();
                BeginContext(5189, 2, true);
                WriteLiteral("\r\n");
                EndContext();
#line 97 "D:\GithubProjeler\TaskManager\TaskWeb\Views\Gorev\Detay.cshtml"
                                            }

                                        }

#line default
#line hidden
                BeginContext(5283, 409, true);
                WriteLiteral(@"                                    </select>

                                </div>
                            </div>

                            <div class=""form-group"">
                                <label class=""col-sm-4 control-label""> Not</label>

                                <div class=""col-sm-8"">
                                    <input type=""text"" class=""form-control"" name=""Not""");
                EndContext();
                BeginWriteAttribute("value", " value=\"", 5692, "\"", 5710, 1);
#line 109 "D:\GithubProjeler\TaskManager\TaskWeb\Views\Gorev\Detay.cshtml"
WriteAttributeValue("", 5700, Model.Not, 5700, 10, false);

#line default
#line hidden
                EndWriteAttribute();
                BeginContext(5711, 342, true);
                WriteLiteral(@">
                                </div>
                            </div>

                            <div class=""form-group"">
                                
                                <div class=""col-sm-6 col-sm-offset-5"">
                                    <a class='btn btn-danger default-delete' data-url='/Gorev/Sil?Id=");
                EndContext();
                BeginContext(6054, 8, false);
#line 116 "D:\GithubProjeler\TaskManager\TaskWeb\Views\Gorev\Detay.cshtml"
                                                                                                Write(Model.id);

#line default
#line hidden
                EndContext();
                BeginContext(6062, 13, true);
                WriteLiteral("\' data-name=\'");
                EndContext();
                BeginContext(6076, 13, false);
#line 116 "D:\GithubProjeler\TaskManager\TaskWeb\Views\Gorev\Detay.cshtml"
                                                                                                                      Write(Model.GorevAd);

#line default
#line hidden
                EndContext();
                BeginContext(6089, 238, true);
                WriteLiteral("\' href=\'javascript:void(0)\'>Sil</a>\r\n                                    <button class=\"btn btn-primary\" type=\"submit\">Kaydet</button>\r\n                                </div>\r\n                            </div>\r\n\r\n                        ");
                EndContext();
            }
            );
            __Microsoft_AspNetCore_Mvc_TagHelpers_FormTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.TagHelpers.FormTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_TagHelpers_FormTagHelper);
            __Microsoft_AspNetCore_Mvc_TagHelpers_RenderAtEndOfFormTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_TagHelpers_RenderAtEndOfFormTagHelper);
            BeginAddHtmlAttributeValues(__tagHelperExecutionContext, "action", 1, global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
#line 22 "D:\GithubProjeler\TaskManager\TaskWeb\Views\Gorev\Detay.cshtml"
AddHtmlAttributeValue("", 796, Url.Action("Guncelle", "Gorev"), 796, 32, false);

#line default
#line hidden
            EndAddHtmlAttributeValues(__tagHelperExecutionContext);
            __Microsoft_AspNetCore_Mvc_TagHelpers_FormTagHelper.Method = (string)__tagHelperAttribute_1.Value;
            __tagHelperExecutionContext.AddTagHelperAttribute(__tagHelperAttribute_1);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_2);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_3);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_4);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
            EndContext();
            BeginContext(6334, 114, true);
            WriteLiteral("\r\n                    </div>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </div>\r\n</div>\r\n\r\n\r\n");
            EndContext();
            DefineSection("Scripts", async() => {
                BeginContext(6466, 549, true);
                WriteLiteral(@"


    <script type=""text/javascript"">

        $(function () {
            $("".selectKullanici"").select2({
                placeholder: ""Kullanıcı Seçiniz"",
            });

            $("".selectGorevDurum"").select2({
                placeholder: ""Durum Seçiniz"",
            });


            $('#dtBaslangic').datetimepicker({
                format: 'DD.MM.YYYY HH:mm'
            });

            $('#dtBitis').datetimepicker({
                format: 'DD.MM.YYYY HH:mm'
            });
        });
    </script>



");
                EndContext();
            }
            );
            BeginContext(7018, 2, true);
            WriteLiteral("\r\n");
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
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<GorevEvent> Html { get; private set; }
    }
}
#pragma warning restore 1591
