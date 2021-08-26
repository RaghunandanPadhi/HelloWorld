trigger approvalTrigger on Account (after insert) {
    DynamicApproval.callMe(Trigger.new);

}