<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>

    <!-- ATG Training -->
    <!-- Creating Commerce Applications -->
    <!-- fragment to loop through a list of SKUs and display SKU info -->
    <!-- Last modified: 6 Apr 06 by KL -->

    <!-- this is a holder page for the chapter 6 labs -->

    <!-- Title: Sku List -->

    <%-- Declare the "product" parameter here --%>
    <DECLAREPARAM NAME="product" CLASS="atg.repository.RepositoryItem" DESCRIPTION="Product Item">
    <%-- End parameter declaration--%>

    <dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
    <dsp:importbean bean="/atg/commerce/pricing/priceLists/PriceDroplet"/>
    <dsp:importbean bean="/atg/dynamo/droplet/Switch"/>
    <dsp:importbean bean="/atg/commerce/pricing/priceLists/ComplexPriceDroplet"/>
    <dsp:importbean bean="/atg/dynamo/droplet/For"/>
    <dsp:importbean bean="/atg/commerce/inventory/InventoryLookup"/>

    <%/* This page fragment displays SKU detail. */%>

    <dsp:droplet name="ForEach">
        <dsp:param name="array" param="product.childSKUs"/>

        <dsp:oparam name="outputStart">
            <p>Skulist:</p>
            <ul>
        </dsp:oparam>
        <dsp:oparam name="outputEnd">
            </ul>
        </dsp:oparam>
        <dsp:oparam name="output">
            <dsp:param name="sku" param="element"/>
            <li>
                <dsp:valueof param="sku.displayName"/>

                <%-- Chapter 6, Exercise 1, Part 3 --%>
                <%-- Insert the PriceDroplet and ComplexPriceDroplet here --%>
                <dsp:droplet name="PriceDroplet">
                    <dsp:param name="sku" param="sku"/>
                    <dsp:param name="product" param="product"/>
                    <dsp:oparam name="output">
                        <dsp:droplet name="Switch">
                            <dsp:param name="value" param="price.pricingScheme"/>
                            <dsp:oparam name="listPrice">
                                <dsp:include page="discountprice.jsp">
                                    <dsp:param name="product" param="product"/>
                                    <dsp:param name="sku" param="sku"/>
                                </dsp:include>
                            </dsp:oparam>
                            <dsp:oparam name="bulkPrice">
                                <dsp:droplet name="ComplexPriceDroplet">
                                    <dsp:param name="complexPrice" param="price.complexPrice"/>
                                    <dsp:oparam name="output">
                                        <dsp:droplet name="For">
                                            <dsp:param name="howMany" param="numLevels"/>
                                            <dsp:oparam name="outputStart">
                                                <ul>
                                            </dsp:oparam>
                                            <dsp:oparam name="outputEnd">
                                                </ul>
                                            </dsp:oparam>
                                            <dsp:oparam name="output">
                                                <li>
                                                    <dsp:valueof param="levelMinimums[param:index]"/>
                                                    -
                                                    <dsp:valueof param="levelMaximums[param:index]">or over</dsp:valueof>
                                                    <b><dsp:valueof converter="currency" param="prices[param:index]"/></b>
                                                </li>
                                            </dsp:oparam>
                                        </dsp:droplet>
                                    </dsp:oparam>
                                </dsp:droplet>
                            </dsp:oparam>
                        </dsp:droplet>
                    </dsp:oparam>
                </dsp:droplet>
            </li>

            <%-- Chapter 7, Exercise 1 --%>
            <%-- Insert Add to Cart button here --%>
            <dsp:include page="addtocart.jsp">
                <dsp:param name="skuId" param="sku.repositoryId"/>
                <dsp:param name="productId" param="product.repositoryId"/>
            </dsp:include>



            <%-- Chapter 13, Exercise 2: Inventory Lookup --%>
            <dsp:droplet name="InventoryLookup">
                <dsp:param name="itemId" param="sku.repositoryId"/>
                <dsp:param name="useCache" param="false"/>
                <dsp:oparam name="output">
                    <dsp:valueof param="inventoryInfo.availabilityStatusMsg"/>
                </dsp:oparam>
            </dsp:droplet>

        </dsp:oparam>
        <dsp:oparam name="empty">
            None available.
        </dsp:oparam>
    </dsp:droplet>


</dsp:page>
