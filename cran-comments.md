## R CMD check results

0 errors  | 0 warnings | 0 notes

* This is a new package and a resubmission
* This package has been tested on local MAC and rub using the Rhub Github Actions tools to test Linux, Mac, Windows. 
* Possibily mispelled words identified in the description are not false alarms and occur from valid language (i.e, "pre-written" and "et al.")
* 
### Issue resolved from submission
- Properly cited methods in the DESCRIPTION
- Update packages, software, and APIs with single quotations
- Removed all `getwd` statements as defaults and require user to explicity enter file path
- Vignettes do not utilize any local, package, or user directories
- Title has double quotes
- Removed use of `installed.packages()` to use `requireNamespace`