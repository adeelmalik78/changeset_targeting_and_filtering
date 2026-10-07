# Changeset Targeting and Filtering

[Liquibase Secure 6.0.0](https://docs.liquibase.com/secure/release-notes-6-0/6-0-0-secure-release-notes) came with 4 new changelog attributes:

* Conditions
    * changeset attribute: `conditions` ([doc](https://docs.liquibase.com/secure/reference-guide-6-0/changelog-attributes/conditions))
    * runtime arg: `conditions-filter` ([doc](https://docs.liquibase.com/secure/reference-guide-6-0/changelog-attributes/conditions-filter))
* Keywords
    * changeset attribute: `keywords` ([doc](https://docs.liquibase.com/secure/reference-guide-6-0/changelog-attributes/keywords))
    * runtime arg: `keywords-filter` ([doc](https://docs.liquibase.com/secure/reference-guide-6-0/changelog-attributes/keywords-filter))
* Releases
    * changeset attribute: `releases` ([doc](https://docs.liquibase.com/secure/reference-guide-6-0/changelog-attributes/releases))
    * runtime arg: `releases-filter` ([doc](https://docs.liquibase.com/secure/reference-guide-6-0/changelog-attributes/releases-filter))
* Teams
    * changeset attribute: `teams` ([doc](https://docs.liquibase.com/secure/reference-guide-6-0/changelog-attributes/teams))
    * runtime arg: `teams-filter` ([doc](https://docs.liquibase.com/secure/reference-guide-6-0/changelog-attributes/teams-filter))


Four new changeset attributes, `teams`, `releases`, `keywords`, and `conditions`, let you tag changesets with the organizational metadata you actually plan by, and the matching `--teams-filter`, `--releases-filter`, `--keywords-filter`, and `--conditions-filter` flags select on them at run time. 

Add the `@` operator to any of these filters for strict matching, so a filter selects only changesets with the exact value. Teams can deploy one release’s changes, one team’s changes, or one flagged subset from a shared changelog without maintaining parallel context and label schemes, and validate `--strict` checks the new attributes for typos before anything runs. These new attributes are also included in `status --verbose=true` output:

``` bash
% liquibase status --verbose=true
####################################################
##   _     _             _ _                      ##
##  | |   (_)           (_) |                     ##
##  | |    _  __ _ _   _ _| |__   __ _ ___  ___   ##
##  | |   | |/ _` | | | | | '_ \ / _` / __|/ _ \  ##
##  | |___| | (_| | |_| | | |_) | (_| \__ \  __/  ##
##  \_____/_|\__, |\__,_|_|_.__/ \__,_|___/\___|  ##
##              | |                               ##
##              |_|                               ##
##                                                ## 
##  Taking Liquibase to production?               ##
##  liquibase.com/liquibase-secure                ## 
##                                                ##
####################################################
Starting Liquibase Secure at 13:12:31 using Java 21.0.12.1 (version 6.0.0 #70 built at 2026-09-29 19:26:40 UTC)
Liquibase Secure Version: 6.0.0
Liquibase Secure license issued to Liquibase_CS_Team, valid until Wed Dec 30 00:00:00 CST 2026
3 changesets have not been applied to postgres@jdbc:postgresql://localhost:5432/postgres
     changelog.xml::customer::amalik
       - labels:customer
       - context:dev,qa,prod
       - teams:blue
       - releases:1.0
       - keywords:bank1
       - conditions:prebuild
     changelog.xml::employee::amalik
       - labels:employee
       - context:dev,qa,prod
       - teams:green
       - releases:1.1
       - keywords:payments
       - conditions:prebuild
     changelog.xml::contractor::amalik
INFO: For more concise 'status' output, drop the '--verbose' flag
Liquibase command 'status' was executed successfully.

% liquibase status --conditions-filter=@prebuild --teams-filter=@blue
####################################################
##   _     _             _ _                      ##
##  | |   (_)           (_) |                     ##
##  | |    _  __ _ _   _ _| |__   __ _ ___  ___   ##
##  | |   | |/ _` | | | | | '_ \ / _` / __|/ _ \  ##
##  | |___| | (_| | |_| | | |_) | (_| \__ \  __/  ##
##  \_____/_|\__, |\__,_|_|_.__/ \__,_|___/\___|  ##
##              | |                               ##
##              |_|                               ##
##                                                ## 
##  Taking Liquibase to production?               ##
##  liquibase.com/liquibase-secure                ## 
##                                                ##
####################################################
Starting Liquibase Secure at 13:20:28 using Java 21.0.12.1 (version 6.0.0 #70 built at 2026-09-29 19:26:40 UTC)
Liquibase Secure Version: 6.0.0
Liquibase Secure license issued to Liquibase_CS_Team, valid until Wed Dec 30 00:00:00 CST 2026 WARNING: This Liquibase Secure license expires on 2026-12-30, in 84 days.
1 changeset has not been applied to postgres@jdbc:postgresql://localhost:5432/postgres
     changelog.xml::customer::amalik
Liquibase command 'status' was executed successfully.
``` 
