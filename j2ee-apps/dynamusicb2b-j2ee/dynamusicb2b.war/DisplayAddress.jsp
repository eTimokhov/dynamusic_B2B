<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>

    <%
        /* -------------------------------------------------------
         * Display an address
         * ------------------------------------------------------- */
    %>
    <dsp:importbean bean="/atg/dynamo/droplet/IsEmpty"/>
    <dsp:importbean bean="/atg/dynamo/droplet/Switch"/>


    <DECLAREPARAM NAME="address"
    CLASS="java.lang.Object"
    DESCRIPTION="A ContactInfo Repository Item to display">


    <nobr><dsp:valueof param="address.companyName"/></nobr>
    <br>
    <nobr><dsp:valueof param="address.address1"/></nobr>
    <br>
    <dsp:droplet name="IsEmpty">
        <dsp:param name="value" param="address.address2"/>
        <dsp:oparam name="false">
            <nobr><dsp:valueof param="address.address2"/></nobr>
            <br>
        </dsp:oparam>
    </dsp:droplet>
    <dsp:valueof param="address.city"/>,
    <dsp:valueof param="address.state"/>
    <dsp:valueof param="address.postalCode"/>
    <br>
    <dsp:valueof param="address.country"/>

</dsp:page>
<%-- @version $Id: //edu/ILT-Courses/main/Commerce/StudentFiles/Commerce/setup/DynamusicB2B/j2ee-apps/dynamusicb2b-j2ee/dynamusicb2b.war/DisplayAddress.jsp#5 $$Change: 514668 $--%>
