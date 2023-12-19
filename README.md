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
```

Any new XML file added to the `changelog` directory will automatically be picked up by Liquibase as new changelog to be deployed.


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