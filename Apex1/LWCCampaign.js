import { LightningElement, wire } from 'lwc';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
import CAMPAIGN_NAME_FIELD from '@salesforce/schema/Campaign.Name';
import CAMPAIGN_START_DATE_FIELD from '@salesforce/schema/Campaign.StartDate';
import CAMPAIGN_END_DATE_FIELD from '@salesforce/schema/Campaign.EndDate';

const FIELDS = [CAMPAIGN_NAME_FIELD, CAMPAIGN_START_DATE_FIELD, CAMPAIGN_END_DATE_FIELD];

export default class CampaignDetails extends LightningElement {
    campaignId;

    @wire(getRecord, { recordId: '$campaignId', fields: FIELDS })
    campaign;

    get campaignName() {
        return getFieldValue(this.campaign.data, CAMPAIGN_NAME_FIELD);
    }

    get campaignStartDate() {
        return getFieldValue(this.campaign.data, CAMPAIGN_START_DATE_FIELD);
    }

    get campaignEndDate() {
        return getFieldValue(this.campaign.data, CAMPAIGN_END_DATE_FIELD);
    }

    handleCampaignSelection(event) {
        this.campaignId = event.detail;
    }
}
