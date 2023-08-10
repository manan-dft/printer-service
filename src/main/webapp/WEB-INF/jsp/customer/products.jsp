<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Products</title>
        <link rel="stylesheet" href="">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/noty/3.1.4/noty.css" integrity="sha512-NXUhxhkDgZYOMjaIgd89zF2w51Mub53Ru3zCNp5LTlEzMbNNAjTjDbpURYGS5Mop2cU4b7re1nOIucsVlrx9fA==" crossorigin="anonymous" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" />
        <link rel="stylesheet" href="https://unpkg.com/@shopify/polaris@6.2.1/dist/styles.css" />
        <style>
            td.highlight {
                color: red;
            }
            #tblProduct tbody tr:hover {
                color: orange;
                cursor: pointer;
            }
            .top {
			  background-color: rgb(246, 246, 247); color: rgb(32, 34, 35); --p-background:rgba(246, 246, 247, 1); --p-background-hovered:rgba(241, 242, 243, 1); --p-background-pressed:rgba(237, 238, 239, 1); --p-background-selected:rgba(237, 238, 239, 1); --p-surface:rgba(255, 255, 255, 1); --p-surface-neutral:rgba(228, 229, 231, 1); --p-surface-neutral-hovered:rgba(219, 221, 223, 1); --p-surface-neutral-pressed:rgba(201, 204, 208, 1); --p-surface-neutral-disabled:rgba(241, 242, 243, 1); --p-surface-neutral-subdued:rgba(246, 246, 247, 1); --p-surface-subdued:rgba(250, 251, 251, 1); --p-surface-disabled:rgba(250, 251, 251, 1); --p-surface-hovered:rgba(246, 246, 247, 1); --p-surface-pressed:rgba(241, 242, 243, 1); --p-surface-depressed:rgba(237, 238, 239, 1); --p-backdrop:rgba(0, 0, 0, 0.5); --p-overlay:rgba(255, 255, 255, 0.5); --p-shadow-from-dim-light:rgba(0, 0, 0, 0.2); --p-shadow-from-ambient-light:rgba(23, 24, 24, 0.05); --p-shadow-from-direct-light:rgba(0, 0, 0, 0.15); --p-hint-from-direct-light:rgba(0, 0, 0, 0.15); --p-surface-search-field:rgba(241, 242, 243, 1); --p-border:rgba(140, 145, 150, 1); --p-border-neutral-subdued:rgba(186, 191, 195, 1); --p-border-hovered:rgba(153, 158, 164, 1); --p-border-disabled:rgba(210, 213, 216, 1); --p-border-subdued:rgba(201, 204, 207, 1); --p-border-depressed:rgba(87, 89, 89, 1); --p-border-shadow:rgba(174, 180, 185, 1); --p-border-shadow-subdued:rgba(186, 191, 196, 1); --p-divider:rgba(225, 227, 229, 1); --p-icon:rgba(92, 95, 98, 1); --p-icon-hovered:rgba(26, 28, 29, 1); --p-icon-pressed:rgba(68, 71, 74, 1); --p-icon-disabled:rgba(186, 190, 195, 1); --p-icon-subdued:rgba(140, 145, 150, 1); --p-text:rgba(32, 34, 35, 1); --p-text-disabled:rgba(140, 145, 150, 1); --p-text-subdued:rgba(109, 113, 117, 1); --p-interactive:rgba(44, 110, 203, 1); --p-interactive-disabled:rgba(189, 193, 204, 1); --p-interactive-hovered:rgba(31, 81, 153, 1); --p-interactive-pressed:rgba(16, 50, 98, 1); --p-focused:rgba(69, 143, 255, 1); --p-surface-selected:rgba(242, 247, 254, 1); --p-surface-selected-hovered:rgba(237, 244, 254, 1); --p-surface-selected-pressed:rgba(229, 239, 253, 1); --p-icon-on-interactive:rgba(255, 255, 255, 1); --p-text-on-interactive:rgba(255, 255, 255, 1); --p-action-secondary:rgba(255, 255, 255, 1); --p-action-secondary-disabled:rgba(255, 255, 255, 1); --p-action-secondary-hovered:rgba(246, 246, 247, 1); --p-action-secondary-pressed:rgba(241, 242, 243, 1); --p-action-secondary-depressed:rgba(109, 113, 117, 1); --p-action-primary:rgba(0, 128, 96, 1); --p-action-primary-disabled:rgba(241, 241, 241, 1); --p-action-primary-hovered:rgba(0, 110, 82, 1); --p-action-primary-pressed:rgba(0, 94, 70, 1); --p-action-primary-depressed:rgba(0, 61, 44, 1); --p-icon-on-primary:rgba(255, 255, 255, 1); --p-text-on-primary:rgba(255, 255, 255, 1); --p-text-primary:rgba(0, 123, 92, 1); --p-text-primary-hovered:rgba(0, 108, 80, 1); --p-text-primary-pressed:rgba(0, 92, 68, 1); --p-surface-primary-selected:rgba(241, 248, 245, 1); --p-surface-primary-selected-hovered:rgba(179, 208, 195, 1); --p-surface-primary-selected-pressed:rgba(162, 188, 176, 1); --p-border-critical:rgba(253, 87, 73, 1); --p-border-critical-subdued:rgba(224, 179, 178, 1); --p-border-critical-disabled:rgba(255, 167, 163, 1); --p-icon-critical:rgba(215, 44, 13, 1); --p-surface-critical:rgba(254, 211, 209, 1); --p-surface-critical-subdued:rgba(255, 244, 244, 1); --p-surface-critical-subdued-hovered:rgba(255, 240, 240, 1); --p-surface-critical-subdued-pressed:rgba(255, 233, 232, 1); --p-surface-critical-subdued-depressed:rgba(254, 188, 185, 1); --p-text-critical:rgba(215, 44, 13, 1); --p-action-critical:rgba(216, 44, 13, 1); --p-action-critical-disabled:rgba(241, 241, 241, 1); --p-action-critical-hovered:rgba(188, 34, 0, 1); --p-action-critical-pressed:rgba(162, 27, 0, 1); --p-action-critical-depressed:rgba(108, 15, 0, 1); --p-icon-on-critical:rgba(255, 255, 255, 1); --p-text-on-critical:rgba(255, 255, 255, 1); --p-interactive-critical:rgba(216, 44, 13, 1); --p-interactive-critical-disabled:rgba(253, 147, 141, 1); --p-interactive-critical-hovered:rgba(205, 41, 12, 1); --p-interactive-critical-pressed:rgba(103, 15, 3, 1); --p-border-warning:rgba(185, 137, 0, 1); --p-border-warning-subdued:rgba(225, 184, 120, 1); --p-icon-warning:rgba(185, 137, 0, 1); --p-surface-warning:rgba(255, 215, 157, 1); --p-surface-warning-subdued:rgba(255, 245, 234, 1); --p-surface-warning-subdued-hovered:rgba(255, 242, 226, 1); --p-surface-warning-subdued-pressed:rgba(255, 235, 211, 1); --p-text-warning:rgba(145, 106, 0, 1); --p-border-highlight:rgba(68, 157, 167, 1); --p-border-highlight-subdued:rgba(152, 198, 205, 1); --p-icon-highlight:rgba(0, 160, 172, 1); --p-surface-highlight:rgba(164, 232, 242, 1); --p-surface-highlight-subdued:rgba(235, 249, 252, 1); --p-surface-highlight-subdued-hovered:rgba(228, 247, 250, 1); --p-surface-highlight-subdued-pressed:rgba(213, 243, 248, 1); --p-text-highlight:rgba(52, 124, 132, 1); --p-border-success:rgba(0, 164, 124, 1); --p-border-success-subdued:rgba(149, 201, 180, 1); --p-icon-success:rgba(0, 127, 95, 1); --p-surface-success:rgba(174, 233, 209, 1); --p-surface-success-subdued:rgba(241, 248, 245, 1); --p-surface-success-subdued-hovered:rgba(236, 246, 241, 1); --p-surface-success-subdued-pressed:rgba(226, 241, 234, 1); --p-text-success:rgba(0, 128, 96, 1); --p-decorative-one-icon:rgba(126, 87, 0, 1); --p-decorative-one-surface:rgba(255, 201, 107, 1); --p-decorative-one-text:rgba(61, 40, 0, 1); --p-decorative-two-icon:rgba(175, 41, 78, 1); --p-decorative-two-surface:rgba(255, 196, 176, 1); --p-decorative-two-text:rgba(73, 11, 28, 1); --p-decorative-three-icon:rgba(0, 109, 65, 1); --p-decorative-three-surface:rgba(146, 230, 181, 1); --p-decorative-three-text:rgba(0, 47, 25, 1); --p-decorative-four-icon:rgba(0, 106, 104, 1); --p-decorative-four-surface:rgba(145, 224, 214, 1); --p-decorative-four-text:rgba(0, 45, 45, 1); --p-decorative-five-icon:rgba(174, 43, 76, 1); --p-decorative-five-surface:rgba(253, 201, 208, 1); --p-decorative-five-text:rgba(79, 14, 31, 1); --p-border-radius-base:0.4rem; --p-border-radius-wide:0.8rem; --p-border-radius-full:50%; --p-card-shadow:0px 0px 5px var(--p-shadow-from-ambient-light), 0px 1px 2px var(--p-shadow-from-direct-light); --p-popover-shadow:-1px 0px 20px var(--p-shadow-from-ambient-light), 0px 1px 5px var(--p-shadow-from-direct-light); --p-modal-shadow:0px 26px 80px var(--p-shadow-from-dim-light), 0px 0px 1px var(--p-shadow-from-dim-light); --p-top-bar-shadow:0 2px 2px -1px var(--p-shadow-from-direct-light); --p-button-drop-shadow:0 1px 0 rgba(0, 0, 0, 0.05); --p-button-inner-shadow:inset 0 -1px 0 rgba(0, 0, 0, 0.2); --p-button-pressed-inner-shadow:inset 0 1px 0 rgba(0, 0, 0, 0.15); --p-override-none:none; --p-override-transparent:transparent; --p-override-one:1; --p-override-visible:visible; --p-override-zero:0; --p-override-loading-z-index:514; --p-button-font-weight:500; --p-non-null-content:''; --p-choice-size:2rem; --p-icon-size:1rem; --p-choice-margin:0.1rem; --p-control-border-width:0.2rem; --p-banner-border-default:inset 0 0.1rem 0 0 var(--p-border-neutral-subdued), inset 0 0 0 0.1rem var(--p-border-neutral-subdued); --p-banner-border-success:inset 0 0.1rem 0 0 var(--p-border-success-subdued), inset 0 0 0 0.1rem var(--p-border-success-subdued); --p-banner-border-highlight:inset 0 0.1rem 0 0 var(--p-border-highlight-subdued), inset 0 0 0 0.1rem var(--p-border-highlight-subdued); --p-banner-border-warning:inset 0 0.1rem 0 0 var(--p-border-warning-subdued), inset 0 0 0 0.1rem var(--p-border-warning-subdued); --p-banner-border-critical:inset 0 0.1rem 0 0 var(--p-border-critical-subdued), inset 0 0 0 0.1rem var(--p-border-critical-subdued); --p-badge-mix-blend-mode:luminosity; --p-thin-border-subdued:0.1rem solid var(--p-border-subdued); --p-text-field-spinner-offset:0.2rem; --p-text-field-focus-ring-offset:-0.4rem; --p-text-field-focus-ring-border-radius:0.7rem; --p-button-group-item-spacing:-0.1rem; --p-duration-1-0-0:100ms; --p-duration-1-5-0:150ms; --p-ease-in:cubic-bezier(0.5, 0.1, 1, 1); --p-ease:cubic-bezier(0.4, 0.22, 0.28, 1); --p-range-slider-thumb-size-base:1.6rem; --p-range-slider-thumb-size-active:2.4rem; --p-range-slider-thumb-scale:1.5; --p-badge-font-weight:400; --p-frame-offset:0px;
			}

			.layout {
			    background-color: white;
			    border: 1px solid #E7E7E7;
			    border-radius: 0.8em;
			    padding: 1em;
			    align-content: space-around;
			    margin: 1em;
			    margin-bottom: 1em;
			    flex: content;
			  }

			  .second-layout{
			    margin: 1em;
			  }
			  .form-layout {
			    background-color: white;
			    border: 1px solid #E7E7E7;
			    border-radius: 0.8em;
			    align-content: space-around;
			    padding: 1em;

			  }

			  /*Switchery*/
			.switch {
			  position: relative;
			  display: inline-block;
			  width: 55px;
			  height: 28px;
			}

			.switch input {
			  opacity: 0;
			  width: 0;
			  height: 0;
			}

			.slider {
			  position: absolute;
			  cursor: pointer;
			  top: 0;
			  left: 0;
			  right: 0;
			  bottom: 0;
			  background-color: #ccc;
			  -webkit-transition: .4s;
			  transition: .4s;
			}

			.slider:before {
			  position: absolute;
			  content: "";
			  height: 20px;
			  width: 20px;
			  left: 4px;
			  bottom: 4px;
			  background-color: white;
			  -webkit-transition: .4s;
			  transition: .4s;
			}

			input:checked + .slider {
			  background-color: #2196F3;
			}

			input:focus + .slider {
			  box-shadow: 0 0 1px #2196F3;
			}

			input:checked + .slider:before {
			  -webkit-transform: translateX(26px);
			  -ms-transform: translateX(26px);
			  transform: translateX(26px);
			}

			/* Rounded sliders */
			.slider.round {
			  border-radius: 34px;
			}

			.slider.round:before {
			  border-radius: 50%;
			}

			/*Top Navigation Bar*/
			.topnav {
			  overflow: hidden;
			  background-color: rgb(155, 152, 152);
			}

			.topnav a {
			  float: left;
			  color: #f2f2f2;
			  text-align: center;
			  padding: 14px 16px;
			  text-decoration: none;
			  font-size: 17px;
			}

			.topnav a:hover {
			  background-color: #ddd;
			  color: black;
			}

			.topnav a.active {
			  background-color: #2196F3;
			  color: white;
			}
        </style>
    </head>
<body>
    <div class="top">

        <div class="topnav">
            <a href="#home">Home</a>
            <a class="active" href=".	">Settings</a>
            <a href="./manual_installation.jsp">Manual Installation</a>
            <a href="help.jsp">Help</a>
          </div>

        <div>
        	<form id="form" name="form" action="create-account-store" method="post">
              <div class="Polaris-Page__Content" id="manual_installation">
                <div class="Polaris-Card layout" >
                  <div class="">
                    <div class="Polaris-DataTable__Navigation"><button class="Polaris-Button Polaris-Button--disabled Polaris-Button--plain Polaris-Button--iconOnly" aria-label="Scroll table left one column" type="button" disabled=""><span class="Polaris-Button__Content"><span class="Polaris-Button__Icon"><span class="Polaris-Icon"><svg viewBox="0 0 20 20" class="Polaris-Icon__Svg" focusable="false" aria-hidden="true">
                                <path d="M12 16a.997.997 0 0 1-.707-.293l-5-5a.999.999 0 0 1 0-1.414l5-5a.999.999 0 1 1 1.414 1.414L8.414 10l4.293 4.293A.999.999 0 0 1 12 16z"></path>
                              </svg></span></span></span></button><button class="Polaris-Button Polaris-Button--plain Polaris-Button--iconOnly" aria-label="Scroll table right one column" type="button"><span class="Polaris-Button__Content"><span class="Polaris-Button__Icon"><span class="Polaris-Icon"><svg viewBox="0 0 20 20" class="Polaris-Icon__Svg" focusable="false" aria-hidden="true">
                                <path d="M8 16a.999.999 0 0 1-.707-1.707L11.586 10 7.293 5.707a.999.999 0 1 1 1.414-1.414l5 5a.999.999 0 0 1 0 1.414l-5 5A.997.997 0 0 1 8 16z"></path>
                              </svg></span></span></span></button></div>
                    <div class="Polaris-DataTable">
                      <div class="Polaris-DataTable__ScrollContainer">
                        <table class="Polaris-DataTable__Table">
                          <thead>


                          </thead>
                          <tbody>
                            <tr  class="Polaris-DataTable__TableRow Polaris-DataTable--hoverable">
                              <th class="Polaris-DataTable__Cell Polaris-DataTable__Cell--verticalAlignTop Polaris-DataTable__Cell--firstColumn" scope="row">Show Product Count</th>
                              <td class="Polaris-DataTable__Cell Polaris-DataTable__Cell--verticalAlignTop Polaris-DataTable__Cell--numeric">
                                <label class="switch">
                                    <input type="checkbox" id="showProductCount" name="showProductCount" checked>
                                    <span class="slider round"></span>
                                </label>
                              </td>
                              <td id="tdProductCount" class="Polaris-DataTable__Cell Polaris-DataTable__Cell--verticalAlignTop Polaris-DataTable__Cell--numeric">124689</td>

                            </tr>
                            <tr  class="Polaris-DataTable__TableRow Polaris-DataTable--hoverable">
                              <th class="Polaris-DataTable__Cell Polaris-DataTable__Cell--verticalAlignTop Polaris-DataTable__Cell--firstColumn" scope="row">Total Product View</th>
                              <td class="Polaris-DataTable__Cell Polaris-DataTable__Cell--verticalAlignTop Polaris-DataTable__Cell--numeric">
                                <label class="switch">
                                    <input type="checkbox" id="totalProductView" name="totalProductView" checked>
                                    <span class="slider round"></span>
                                </label>
                              </td>
                              <td id="tdProductView" class="Polaris-DataTable__Cell Polaris-DataTable__Cell--verticalAlignTop Polaris-DataTable__Cell--numeric" aria-valuetext="hi">124533</td>

                            </tr>
                            <tr class="Polaris-DataTable__TableRow Polaris-DataTable--hoverable">
                              <th class="Polaris-DataTable__Cell Polaris-DataTable__Cell--verticalAlignTop Polaris-DataTable__Cell--firstColumn" scope="row">Total Orders</th>
                              <td class="Polaris-DataTable__Cell Polaris-DataTable__Cell--verticalAlignTop Polaris-DataTable__Cell--numeric">
                                <label class="switch">
                                    <input type="checkbox" id="totalOrders" name="totalOrders" checked>
                                    <span class="slider round"></span>
                                </label>
                              </td>
                              <td id="tdTotalOrders" class="Polaris-DataTable__Cell Polaris-DataTable__Cell--verticalAlignTop Polaris-DataTable__Cell--numeric">124518</td>

                            </tr>
                            <tr class="Polaris-DataTable__TableRow Polaris-DataTable--hoverable">
                                <th class="Polaris-DataTable__Cell Polaris-DataTable__Cell--verticalAlignTop Polaris-DataTable__Cell--firstColumn" scope="row">Ordered Last Week</th>
                                <td class="Polaris-DataTable__Cell Polaris-DataTable__Cell--verticalAlignTop Polaris-DataTable__Cell--numeric">
                                    <label class="switch">
                                        <input type="checkbox" id="orderedLastWeek" name="orderedLastWeek" checked>
                                        <span class="slider round"></span>
                                    </label>
                                </td>
                                <td id="tdOrderedLastWeek" class="Polaris-DataTable__Cell Polaris-DataTable__Cell--verticalAlignTop Polaris-DataTable__Cell--numeric">124518</td>
                            </tr>
                            <tr class="Polaris-DataTable__TableRow Polaris-DataTable--hoverable">
                                <th class="Polaris-DataTable__Cell Polaris-DataTable__Cell--verticalAlignTop Polaris-DataTable__Cell--firstColumn" scope="row">Items Already in Cart</th>
                                <td class="Polaris-DataTable__Cell Polaris-DataTable__Cell--verticalAlignTop Polaris-DataTable__Cell--numeric">
                                    <label class="switch">
                                        <input type="checkbox" id="itemAlreadyInCart" name="itemAlreadyInCart" checked>
                                        <span class="slider round"></span>
                                    </label>
                                </td>
                                <td id="tdItemsAlreadyInCart" class="Polaris-DataTable__Cell Polaris-DataTable__Cell--verticalAlignTop Polaris-DataTable__Cell--numeric">124518</td>
                            </tr>
                            <tr class="Polaris-DataTable__TableRow Polaris-DataTable--hoverable">
                                <th class="Polaris-DataTable__Cell Polaris-DataTable__Cell--verticalAlignTop Polaris-DataTable__Cell--firstColumn" scope="row">Live Customer</th>
                                <td class="Polaris-DataTable__Cell Polaris-DataTable__Cell--verticalAlignTop Polaris-DataTable__Cell--numeric">
                                    <label class="switch">
                                        <input type="checkbox" id="liveCustomer" name="liveCustomer" checked>
                                        <span class="slider round"></span>
                                    </label>
                                </td>
                                <td id="tdLiveCutomer" class="Polaris-DataTable__Cell Polaris-DataTable__Cell--verticalAlignTop Polaris-DataTable__Cell--numeric">11111</td>
                            </tr>
                          </tbody>
                        </table>
                      </div>
                    </div>
                  </div>
                </div>



                <div class="Polaris-Card layout" >
                    <div>
                        <div class="Polaris-FormLayout">
                            <div class="Polaris-FormLayout__Item">
                                <div class="">
                                    <div class="Polaris-Labelled__LabelWrapper">
                                        <div class="Polaris-Label"><label id="divIdToAppend" for="feedTitle" class="Polaris-Label__Text">Div ID to Apart</label></div>
                                        </div>
                                    <div class="Polaris-Connected">
                                        <div class="Polaris-Connected__Item ">
                                            <div class="Polaris-TextField">
	                                            <input id="divIdToAppend" name="divIdToAppend" maxlength="50" class="Polaris-TextField__Input"
	                                            aria-labelledby="PolarisTextField13Label" aria-invalid="false" value="${accountStoreData.divId}"></input>
	                                            <input type="text" id="accountId" name="accountId" value="${accountStoreData.accountId}" style="display:none">
                                            <div class="Polaris-TextField__Backdrop"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="Polaris-FormLayout__Item">Margin</div>

                            <div class="Polaris-FormLayout__Item">

                                <div class="Polaris-Stack">
                                    <div class="Polaris-Connected__Item second-layout">
                                        <div class="Polaris-TextField">
                                        	<input id="marginTop" name="marginTop" placeholder="top" maxlength="50" class="Polaris-TextField__Input"
                                        	aria-labelledby="PolarisTextField13Label" aria-invalid="false" value="${accountStoreData.marginTop}"></input>
                                        <div class="Polaris-TextField__Backdrop"></div>
                                        </div>
                                        <div class="Polaris-Labelled__HelpText" id="PolarisTextField4HelpText">top</div>
                                    </div>
                                    <div class="Polaris-Connected__Item second-layout">
                                        <div class="Polaris-TextField">
                                        	<input id="marginBottom" name="marginBottom" placeholder="bottom" maxlength="50" class="Polaris-TextField__Input"
                                        	aria-labelledby="PolarisTextField13Label" aria-invalid="false" value="${accountStoreData.marginBottom}"></input>
                                        <div class="Polaris-TextField__Backdrop"></div>
                                        </div>
                                        <div class="Polaris-Labelled__HelpText" id="PolarisTextField4HelpText">bottom</div>
                                    </div>
                                    <div class="Polaris-Connected__Item second-layout">
                                        <div class="Polaris-TextField">
                                        	<input id="marginLeft" name="marginLeft" placeholder="left" maxlength="50" class="Polaris-TextField__Input"
                                        	aria-labelledby="PolarisTextField13Label" aria-invalid="false" value="${accountStoreData.marginLeft}"></input>
                                        <div class="Polaris-TextField__Backdrop"></div>
                                        </div>
                                        <div class="Polaris-Labelled__HelpText" id="PolarisTextField4HelpText">left</div>
                                    </div>
                                    <div class="Polaris-Connected__Item second-layout">
                                        <div class="Polaris-TextField">
                                        	<input id="marginRight" name="marginRight" placeholder="right" maxlength="50" class="Polaris-TextField__Input"
                                        	aria-labelledby="PolarisTextField13Label" aria-invalid="false" value="${accountStoreData.marginRight}"></input>
                                        <div class="Polaris-TextField__Backdrop"></div>
                                        </div>
                                        <div class="Polaris-Labelled__HelpText" id="PolarisTextField4HelpText">right</div>
                                    </div>
                                </div>
                            </div>


                            <div class="Polaris-FormLayout__Item">Box</div>
                            <div class="Polaris-FormLayout__Item">
                                <div class="Polaris-Stack">
                                    <div class="Polaris-Connected__Item second-layout">
                                        <div class="Polaris-TextField">
                                        	<input id="boxHeight" name="boxHeight" placeholder="height" maxlength="50" class="Polaris-TextField__Input"
                                        	aria-labelledby="PolarisTextField13Label" aria-invalid="false" value="${accountStoreData.boxHeight}"></input>
                                        <div class="Polaris-TextField__Backdrop"></div>
                                        </div>
                                        <div class="Polaris-Labelled__HelpText" id="PolarisTextField4HelpText">height</div>
                                    </div>
                                    <div class="Polaris-Connected__Item second-layout">
                                        <div class="Polaris-TextField">
                                        	<input id="boxWidth" name="boxWidth" placeholder="width" maxlength="50" class="Polaris-TextField__Input"
                                        	aria-labelledby="PolarisTextField13Label" aria-invalid="false" value="${accountStoreData.boxWidth}"></input>
                                        <div class="Polaris-TextField__Backdrop"></div>
                                        </div>
                                        <div class="Polaris-Labelled__HelpText" id="PolarisTextField4HelpText">width</div>
                                    </div>
                                </div>
                            </div>


                            <div class="Polaris-FormLayout__Item">Font</div>
                            <div class="Polaris-FormLayout__Item">
                                <div class="Polaris-Stack">
                                    <div class="Polaris-Connected__Item second-layout">
                                        <div class="Polaris-TextField">
                                        	<input id="fontColor" name="fontColor" placeholder="color" maxlength="50" class="Polaris-TextField__Input"
                                        	aria-labelledby="PolarisTextField13Label" aria-invalid="false" value="${accountStoreData.fontColor}"></input>
                                        <div class="Polaris-TextField__Backdrop"></div>
                                        </div>
                                        <div class="Polaris-Labelled__HelpText" id="PolarisTextField4HelpText">color</div>
                                    </div>
                                    <div class="Polaris-Connected__Item second-layout">
                                        <div class="Polaris-TextField">
                                        	<input id="fontWeight" name="fontWeight" placeholder="weight" maxlength="50" class="Polaris-TextField__Input"
                                        	aria-labelledby="PolarisTextField13Label" aria-invalid="false" value="${accountStoreData.fontWeight}"></input>
                                        <div class="Polaris-TextField__Backdrop"></div>
                                        </div>
                                        <div class="Polaris-Labelled__HelpText" id="PolarisTextField4HelpText">weight</div>
                                    </div>
                                    <div class="Polaris-Connected__Item second-layout">
                                        <div class="Polaris-TextField">
                                        	<input id="fontFace" name="fontFace" placeholder="face" maxlength="50" class="Polaris-TextField__Input"
                                        	aria-labelledby="PolarisTextField13Label" aria-invalid="false" value="${accountStoreData.fontFace}"></input>
                                        <div class="Polaris-TextField__Backdrop"></div>
                                        </div>
                                        <div class="Polaris-Labelled__HelpText" id="PolarisTextField4HelpText">face</div>
                                    </div>
                                </div>
                            </div>


                            <div class="Polaris-FormLayout__Item">
                                <div class="Polaris-Stack">
                                    <div class="second-layout">Advanced</div>
                                    <label class="switch second-layout">
                                        <input id="leftButtonAdvanced" name="leftButtonAdvanced" type="checkbox" checked= (("${accountStoreData.fontFace}" == 1) ? "checked" : undefined)>
                                        <span class="slider round"></span>
                                    </label>
                                </div>
                            </div>


                            <div class="Polaris-FormLayout__Item">
                                <div class="Polaris-Labelled__LabelWrapper">
                                    <div class="Polaris-Label"><label id="PolarisTextField6Label" for="PolarisTextField6" class="Polaris-Label__Text">CSS editor</label></div>
                                </div>
                                <div class="Polaris-Connected">
                                    <div class="Polaris-Connected__Item Polaris-Connected__Item--primary">
                                        <div class="Polaris-TextField Polaris-TextField--hasValue Polaris-TextField--multiline">
                                        	<textarea id="css" name="css" class="Polaris-TextField__Input"
                                        	aria-labelledby="PolarisTextField6Label"  aria-invalid="false" aria-multiline="true" style="height: 106px;">${accountStoreData.css}</textarea>
                                        <div class="Polaris-TextField__Backdrop"></div>
                                    </div>
                                </div>
                            </div>

                            <div class="Polaris-FormLayout__Item">
                                <div><button id="btnSubmit" class="Polaris-Button Polaris-Button--primary" type="submit" style="background-color: #2196F3;"><span class="Polaris-Button__Content"><span class="Polaris-Button__Text">Submit</span></span></button>
                                    <div id="PolarisPortalsContainer"></div>
                                  </div>
                            </div>

                        </div>
                    </div>

                </div>
              </div>
            </div>
            <div id="PolarisPortalsContainer"></div>
            </form>
          </div>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript">


        $(document).ready(function () {
             var account_store = {};
             var url = window.location.href;
             console.log("url", url);

             document.getElementById('url').value = window.location.href;
             console.log("hiiii", document.getElementById('url').value);

             $('#btnSubmit').click(function () {
            	 /*
                account_store.divIdToAppend = $('#divApart').val();
                account_store.marginTop = $('#top').val();
                account_store.marginBottom = $('#bottom').val();
                account_store.marginLeft = $('#left').val();
                account_store.marginRight = $('#right').val();
                account_store.boxHeight = $('#height').val();
                account_store.boxWidth = $('#width').val();
                account_store.fontColor = $('#color').val();
                account_store.fontWeight = $('#weight').val();
                account_store.fontFace = $('#face').val();
                account_store.leftButtonAdvanced = $('#advancedCheckbox').val();
                account_store.css = $('#cssEditor').val();
                account_store.showProductCount = $('#tdProductCount').html();
                account_store.showProductCount = $('#tdProductCount').html();
                account_store.totalProductView = $('#tdProductView').html();
                account_store.totalOrders = $('#tdTotalOrders').html();
                account_store.orderedLastWeek = $('#tdOrderedLastWeek').html();
                account_store.itemAlreadyInCart = $('#tdItemsAlreadyInCart').html();
                account_store.liveCustomer = $('#tdLiveCutomer').html();
                account_store.url = window.location.href;


                 var account_storeJson = JSON.stringify(account_store);
                 console.log(account_storeJson);
                 $.ajax({
                     url: 'create-account-store',
                     method: 'POST',
                     data: window.location.href;,
                     contentType: "application/json; charset=utf-8",
                     success: function () {
                         alert('Saved successfully!');
                     },
                     error: function (error) {
                         alert("Error occurred");
                     }
                 })
             })
         });*/

        $(function(){
            /*$("#btnSubmit").on("click", function(e) {
                e.preventDefault(); // cancel default action
                alert('Saved successfully');
                if (this.id=="btnSubmit") {
                  document.getElementById("form").submit(); // or $("#form_id")[0].submit();
                }
            });*/

            $('#form').on('submit', function(e){
              e.preventDefault();
              alert('Saved successfully');
            });
        });
    </script>
</body>
</html>
