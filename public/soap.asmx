<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope">
    <?xml-stylesheet href="common.css"?>
    <?xml-stylesheet href="default.css" title="Default style"?>
    <?xml-stylesheet alternate="yes" href="alt.css" title="Alternative style"?>
    <?xml-stylesheet href="single-col.css" media="all and (max-width: 30em)"?>
    <html xmlns="http://www.w3.org/1999/xhtml">
      <soap:Header>
            <eWAYHeader xmlns="http://www.eway.com.au/gateway/rebill/manageRebill">
                <eWAYCustomerID>91582427</eWAYCustomerID>
                <Username>hetal@briskbrain.com.sand</Username>
                <Password>123456</Password>
            </eWAYHeader>
        </soap:Header>
        <soap:Body>
        <CreateRebillEvent xmlns="http://www.eway.com.au/gateway/rebill/manageRebill">
            <RebillCustomerID>60000000</RebillCustomerID>
            <RebillInvRef>ref123</RebillInvRef>
            <RebillInvDes>Invoice Description</RebillInvDes>
            <RebillCCName>Card Name</RebillCCName>
            <RebillCCNumber>4444333322221111</RebillCCNumber>
            <RebillCCExpMonth>07</RebillCCExpMonth>
            <RebillCCExpYear>17</RebillCCExpYear>
            <RebillInitAmt>100</RebillInitAmt>
            <RebillInitDate>08/06/2015</RebillInitDate>
            <RebillRecurAmt>100</RebillRecurAmt>
            <RebillStartDate>05/07/2017</RebillStartDate>
            <RebillInterval>1</RebillInterval>
            <RebillIntervalType>1</RebillIntervalType>
            <RebillEndDate>08/12/2017</RebillEndDate>
        </CreateRebillEvent>
    </soap:Body>
    </html>
</soap:Envelope>

