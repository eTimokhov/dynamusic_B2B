<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>

    <dsp:importbean bean="/atg/commerce/order/OrderLookup"/>
    <dsp:importbean bean="/atg/userprofiling/Profile"/>
    <dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
    <dsp:importbean bean="/atg/commerce/ShoppingCart"/>


    <%/* expect a order number to be passed in, we could be acceepting a orderid but run the risk of users trying random orderId's and
seeing other people's orders. We might use the obfuscated id generator, but this is safter then even that*/%>

    <DECLAREPARAM NAME="orderId" CLASS="java.lang.Integer" DESCRIPTION="number of the saved order">

    <!-- ATG Training -->
    <!-- Creating Commerce Applications Part I -->
    <!-- Save Order Page -->
    <!-- Last modified: 1 May 07 by RM -->

    <HTML>
    <HEAD>
        <TITLE>Save Order</TITLE>
    </HEAD>
    <BODY>
    <dsp:include page="common/header.jsp">
        <dsp:param name="pagename" value="View My Saved Order"/>
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

                    <dsp:a href="saved_orders.jsp">Saved Orders</dsp:a> &gt;


                        <%-- Enter OrderLookup droplet and input parameters --%>
                    <dsp:droplet name="OrderLookup">
                        <dsp:param name="orderId" param="orderId"/>
                        <dsp:param name="userId" bean="Profile.repositoryId"/>
                        <dsp:param name="state" value="incomplete"/>


                        <dsp:oparam name="error">
                            Could not retreive the specified order :
                            <dsp:valueof param="errorMsg"/>
                        </dsp:oparam>
                        <dsp:oparam name="output">
                            <dsp:param name="order" param="result"/>

                            <b>Saved Order: <dsp:valueof param="order.description"/></b><br>
                            Order #
                            <dsp:valueof param="order.Id"/>
                            - Saved <dsp:valueof date="MMMMM d, yyyy h:mm a" param="order.creationDate"/><br><br>


                            <dsp:droplet name="ForEach">
                                <dsp:param name="array" param="order.commerceItems"/>

                                <dsp:oparam name="output">


                                    <%-- Display part number, product name/link, inventory info columns --%>
                                    <dsp:include page="cart_line_item.jsp" flush="false">
                                        <dsp:param name="item" param="element"/>
                                    </dsp:include>&nbsp;&nbsp;&nbsp;
                                    Qty: <dsp:valueof param="element.quantity"/><br>
                                    &nbsp;&nbsp;&nbsp;

                                    <%-- display total list price and any discounted total price --%>
                                    <dsp:include page="DisplayAmount.jsp" flush="false">
                                        <dsp:param name="item" param="element"/>
                                    </dsp:include><br>


                                </dsp:oparam>
                            </dsp:droplet>
                            <p>

                                <b>Subtotal</b>
                                <b><dsp:valueof converter="currency" param="order.priceInfo.amount"/></b>
                            </p>
                            <p>
                                    <%-- Insert a form to make this order current --%>
                                <dsp:form formid="use" method="post" action="cart.jsp">
                                    <dsp:input type="hidden" bean="ShoppingCart.handlerOrderId" paramvalue="order.id"/>
                                    <dsp:input type="submit" bean="ShoppingCart.switch"
                                               value="Make this order current"/>
                                </dsp:form>


                                    <%-- Insert a form to delete this saved order --%>
                                <dsp:form formid="delete" method="post" action="saved_orders.jsp">
                                    <dsp:input type="hidden" bean="ShoppingCart.handlerOrderId" paramvalue="order.id"/>
                                    <dsp:input type="submit" bean="ShoppingCart.delete" value="Delete"/>
                                </dsp:form>
                            </p>
                        </dsp:oparam> <%/*orderlookup*/%>
                    </dsp:droplet>

                </font>
            </td>
        </tr>
    </table>

    </body>
    </html>

</dsp:page>
<%-- @version $Id: //edu/ILT-Courses/main/Commerce/StudentFiles/Commerce/setup/DynamusicB2B/j2ee-apps/dynamusicb2b-j2ee/dynamusicb2b.war/saved_order.jsp#9 $$Change: 514668 $--%>
