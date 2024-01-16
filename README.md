This repo demonstrates the `root-changelog.xml` and Liquibase `flow` files.

# root-changelog.xml

The `liquibase.properties` file specifies changelog file as: 
``` shell
changeLogFile=root-changelog.xml
```


The `root-changelog.xml` relies on Liquibase's capability of tracking deployed changes. 

The `root-changelog.xml` is setup as follows: 
``` xml
  <includeAll path="./changelog" />
```

The `changelog` directory consists of multiple XML changelogs:
``` shell
├── changelog-1.0.0.xml
├── changelog-1.0.1.xml
└── changelog-1.0.2.xml
└── changelog-9.9.9.xml
```

Any new XML file added to the `changelog` directory will automatically be picked up by Liquibase as new changelog to be deployed.

NOTE: The `changelog-9.9.9.xml` points to `DBAUploads`. This enables any scripts uploaded at runtime by DBAs (via Jenkins) be deployed to the database.
``` xml
    <includeAll path="./DBAUploads" />
```

The logic for uploading DBA scripts would be captured in a Jenkins pipeline job, using a Base64 File Parameter. This requires the use of [File Parameter plugin in Jenkins](https://plugins.jenkins.io/file-parameters/).

<img src=img/FileParameter.png width="450">

# Flow files

Flow files are portable, platform-independent Liquibase workflows that can run anywher without modication [doc](https://docs.liquibase.com/commands/flow/flow.html),

Two flow files are provided in this repository in `Flowfiles` directory:

``` shell
├── liquibase-rollback.flowfile.yaml
└── liquibase-update.flowfile.yaml
```

Liquibase command to execute the flow file (`liquibase-update.flowfile.yaml`):

``` shell
liquibase flow --flow-file=Flowfiles/liquibase-update.flowfile.yaml
```

Liquibase command to execute the flow file (`liquibase-rollback.flowfile.yaml`):
``` shell
liquibase flow --flow-file=Flowfiles/liquibase-rollback.flowfile.yaml
```

# Reports

Report properites are provided in `liquibase.properties` file:
```shell
liquibase.reports.enabled=true
liquibase.reports.path=reports
liquibase.reports.name=update.report.html
```

CATION: In order for reports to render properly ...
1. In Jenkins, go to "Manage Jenkins"
2. Click on "Script Console"
3. Run the following command:

```
System.setProperty("hudson.model.DirectoryBrowserSupport.CSP", "img-src 'self' data:;")
```
