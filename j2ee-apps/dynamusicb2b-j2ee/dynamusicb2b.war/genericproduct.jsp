<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<%@ page isELIgnored="false" %>
<dsp:importbean bean="/atg/commerce/catalog/ProductLookup"/>
<dsp:importbean bean="/atg/commerce/catalog/ProductBrowsed"/>
<dsp:importbean bean="/atg/commerce/catalog/CatalogNavHistoryCollector"/>
<dsp:page>

    <!-- ATG Training -->
    <!-- Creating Commerce Applications -->
    <!-- storefront page to loop through rootCategories property -->
    <!-- Last modified: 3 Apr 06 by KL -->

    <!-- this is a holder page for the chapter 3, Exercise 4 -->
    <!-- for creating a page to display a product -->


    <%-- Declare your "id" parameter here --%>
    <DECLAREPARAM NAME="id" CLASS="java.lang.String" DESCRIPTION="Repository ID">
    <%-- End parameter declaration--%>

    <HTML>
    <HEAD>
        <TITLE>Dynamusic Product Page</TITLE>
    </HEAD>
    <BODY>
    <dsp:include page="common/header.jsp">
        <dsp:param name="pagename" value="Dynamusic Product Page"/>
    </dsp:include>
    <table width="700" cellpadding="8">
        <tr>
            <!-- Sidebar -->
            <td width="100" valign="top">
                <jsp:include page="navbar.jsp" flush="true"></jsp:include>
            </td>
            <!-- Page Body -->
            <td valign="top">
                <font face="Verdana,Geneva,Arial" color="midnightblue">

                        <%-- Chapter 3, Exercise 4 --%>
                        <%-- Insert ProductLookup droplet --%>
                    <dsp:droplet name="ProductLookup">
                        <dsp:param name="id" param="itemId"/>
                        <dsp:oparam name="output">
                            <dsp:droplet name="CatalogNavHistoryCollector">
                                <dsp:param name="item" param="element"/>
                                <dsp:param name="navAction" param="navAction"/>
                                <dsp:param name="navCount" param="navCount"/>
                            </dsp:droplet>
                            <dsp:include page="breadcrumbs.jsp"/>

                            <h3><dsp:valueof param="element.displayName"/></h3>
                            <%-- TODO: Problem with leading slash in image path (some paths have it, others don't. Why?) --%>
                            <img src="<dsp:valueof param="element.smallImage.path"/>"/><br>
                            Description: <dsp:valueof param="element.description"/><br>
                            <dsp:include page="skulist.jsp">
                                <dsp:param name="product" param="element"/>
                            </dsp:include>
                            
                            <dsp:droplet name="ProductBrowsed">
                                <dsp:param name="eventobject" param="element"/>
                            </dsp:droplet>
                        </dsp:oparam>
                    </dsp:droplet>
                </font>

            </td>
        </tr>
    </table>
    </BODY>
    </HTML>

</dsp:page>
