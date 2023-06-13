String cronExp = '0 0 9 * * ?'; // Cron expression for 9 AM every day
OpportunityScheduler scheduler = new OpportunityScheduler();
String jobId = System.schedule('Opportunity Scheduler Job', cronExp, scheduler);
