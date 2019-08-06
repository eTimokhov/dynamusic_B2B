<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>

    <dsp:importbean bean="/atg/commerce/ShoppingCart"/>
    <dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
    <dsp:importbean bean="/atg/userprofiling/Profile"/>
    <dsp:importbean bean="/atg/dynamo/droplet/IsEmpty"/>

    <!-- ATG Training -->
    <!-- Creating Commerce Applications Part I -->
    <!-- Save Order Page -->
    <!-- Last modified: 20 Apr 06 by KL -->

    <HTML>
    <HEAD>
        <TITLE>Saved Orders</TITLE>
    </HEAD>
    <BODY>
    <dsp:include page="common/header.jsp">
        <dsp:param name="pagename" value="My Saved Orders"/>
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


                    <dsp:droplet name="IsEmpty">
                        <%-- testing on the bean ShoppingCart.saved  --%>
                        <dsp:param name="value" bean="ShoppingCart.saved"/>
                        <dsp:oparam name="true">
                            You have no saved orders.
                        </dsp:oparam>

                        <dsp:oparam name="false">
                            <%-- iterate through ShoppingCart.saved and display a link to the order --%>
                            <dsp:droplet name="ForEach">
                                <dsp:param name="array" bean="ShoppingCart.saved"/>
                                <dsp:oparam name="output">
                                    <dsp:a href="saved_order.jsp">
                                        <dsp:param name="orderId" param="element.id"/>
                                        <dsp:valueof param="element.description"/>
                                    </dsp:a>
                                    Order id: <dsp:valueof param="element.id"/>
                                    Creation date: <dsp:valueof param="element.creationDate" date="MMMM d, yyyy h:mm a"/>
                                    <br>
                                </dsp:oparam>
                            </dsp:droplet>
                        </dsp:oparam>
                    </dsp:droplet>
                </font>
            </td>


            </td>
        </tr>
    </table>

    </body>
    </html>
</dsp:page>
<%-- @version $Id: //edu/ILT-Courses/main/Commerce/StudentFiles/Commerce/setup/DynamusicB2B/j2ee-apps/dynamusicb2b-j2ee/dynamusicb2b.war/saved_orders.jsp#8 $$Change: 514668 $--%>
