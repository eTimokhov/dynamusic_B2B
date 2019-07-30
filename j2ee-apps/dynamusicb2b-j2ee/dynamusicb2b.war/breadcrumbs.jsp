<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<%@ page isELIgnored="false" %>
<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
<dsp:importbean bean="/atg/commerce/catalog/CatalogNavHistory"/>
<dsp:page>


    <!-- ATG Training -->
    <!-- Creating Commerce Applications -->
    <!-- storefront page to loop through rootCategories property -->
    <!-- Last modified: 4 Apr 06 by KL -->

    <!-- this is a holder page for the chapter 4, Exercise 2 -->
    <!-- for creating a page to display a category -->
    <!-- This fragment shows a "bread crumb trail", showing the user's navigation
    history, and allowing them to link to the previous products and categories
    they have viewed. -->
    <!-- Title: Breadcrumbs -->

    <font face="Verdana,Geneva,Arial" size="1" color="midnightblue">

            <%-- Chapter 4, Exercise 2 --%>
            <%-- Insert ForEach droplet to iterate through the navHistory --%>

        <dsp:droplet name="ForEach">
            <dsp:param name="array" bean="CatalogNavHistory.navHistory"/>
            <dsp:oparam name="output">
                <dsp:getvalueof var="templateURL" param="element.template.url"/>
                <dsp:a href="${templateURL}">
                    <dsp:param name="itemId" param="element.repositoryId"/>
                    <dsp:param name="navAction" value="pop"/>
                    <dsp:param name="navCount" bean="CatalogNavHistory.navCount"/>
                    <dsp:valueof param="element.displayName"/>
                </dsp:a>
                <dsp:valueof value=" -> "/>
            </dsp:oparam>
        </dsp:droplet>


    </font>
</dsp:page>
