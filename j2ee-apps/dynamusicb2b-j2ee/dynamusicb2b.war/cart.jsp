<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
    <dsp:importbean bean="/atg/userprofiling/Profile"/>
    <dsp:importbean bean="/atg/commerce/order/purchase/CartModifierFormHandler"/>
    <dsp:importbean bean="/atg/commerce/order/purchase/SaveOrderFormHandler"/>
    <dsp:importbean bean="/atg/commerce/ShoppingCart"/>
    <dsp:importbean bean="/atg/dynamo/droplet/Switch"/>
    <dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
    <dsp:importbean bean="/atg/dynamo/droplet/ErrorMessageForEach"/>
    <dsp:importbean bean="/atg/commerce/order/purchase/RepriceOrderDroplet"/>

    <!-- ATG Training -->
    <!-- Creating Commerce Applications Part I -->
    <!-- Cart Page -->
    <!-- Last modified: 1 May 07 by RM -->

    <HTML>
    <HEAD>
        <TITLE>Dynamusic Shopping Cart</TITLE>
    </HEAD>
    <BODY>
    <dsp:include page="common/header.jsp">
        <dsp:param name="pagename" value="Your Shopping Cart"/>
    </dsp:include>
    <table width="700" cellpadding="8">
        <tr>
            <!-- Sidebar -->
            <td width="100" bgcolor="ghostwhite" valign="top">
                <jsp:include page="navbar.jsp" flush="true"></jsp:include>
            </td>
            <!-- Page Body -->
            <td valign="top">
                <font face="Verdana,Geneva,Arial" color="midnightblue">

                        <%-- Chapter 7, Exercise 4, Step 3: Reprice the order when the page is loaded --%>

                            <dsp:droplet name="RepriceOrderDroplet">
                                <dsp:param name="pricingOp" value="ORDER_TOTAL"/>
                            </dsp:droplet>

                        <%-- Chapter 7, Exercise 3, Step 1: Error Handling --%>

                    <dsp:droplet name="ErrorMessageForEach">
                        <dsp:param name="exceptions" bean="CartModifierFormHandler.formExceptions"/>
                        <ul>
                            <dsp:oparam name="output">
                                <li><dsp:valueof param="message"/></li>
                            </dsp:oparam>
                        </ul>
                    </dsp:droplet>


                        <%-- Chapter 7, Exercise 2 --%>
                        <%-- Loop through CommerceItems to display each Commerce Item --%>

                    <br><br>
                </font>
                <dsp:form method="post" action="cart.jsp">
                    <dsp:droplet name="ForEach">
                        <dsp:param name="array" bean="CartModifierFormHandler.order.commerceItems"/>
                        <dsp:oparam name="output">
                            <dsp:param name="Ci" param="element"/>
                            <b><dsp:valueof param="Ci.auxiliaryData.catalogRef.displayName"/></b>
                            <input name="<dsp:valueof param="Ci.id" />" value="<dsp:valueof param="Ci.quantity" />"
                                   size="2">
                            <del><dsp:valueof converter="currency" param="Ci.priceInfo.rawTotalPrice"/></del>
                            <dsp:valueof converter="currency" param="Ci.priceInfo.amount"/>
                            <br>
                        </dsp:oparam>
                    </dsp:droplet>

                    <br><br>
                    <hr size="0">
                    <font face="Verdana,Geneva,Arial" size="+2" color="midnightblue">Shopping Cart Subtotal:</font>
                    <br><br>
                    <font face="Verdana,Geneva,Arial" color="midnightblue">

                            <%-- Chapter 7, Exercise 4: Display Order Subtotal and Recalculate Button --%>
                        <!-- Order Subtotal -->
                        Order subtotal: <dsp:valueof converter="currency"
                                                     bean="CartModifierFormHandler.order.priceInfo.rawSubtotal"/>

                        <!-- Recalculate Button -->
                        <dsp:input type="submit" bean="CartModifierFormHandler.setOrderByRelationshipId"
                                   value="Recalculate"/>


                            <%-- Chapter 9, Exercise 1, Step 4: Test ShippingGroup Address --%>


                            <%-- Chapter 7, Exercise 3, Step 2: Add Checkout Button --%>
                        <dsp:input type="hidden" bean="CartModifierFormHandler.moveToPurchaseInfoSuccessURL"
                                   value="purchaseinfo.jsp"/>
                        <dsp:input type="submit" bean="CartModifierFormHandler.moveToPurchaseInfoByCommerceId" value="Checkout"/>
                    </font>
                </dsp:form>
                <br><br>
                    <%-- Chapter 7, Optional Exercise 7: Display User's Promotions --%>


                    <%-- Chapter 11, Exercise 1: Create Save Order Form --%>

            </td>
        </tr>
    </table>
    </body>
    </html>


</dsp:page>