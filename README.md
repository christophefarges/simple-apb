Simple APB
=========

A simple apb example designed to showcase the creation of an apb instanciating ressources in two namespaces.

In this example, we will create a servicemonitor object in a namespace with an operator-deployed prometheus.

The goal is to showcase how an apb can be used to auto register an application with a prometheus in order to gather metrics.


Prerequisites
-------------

* oc client
* Openshift with a prometheus deployed via the prometheus operator 
  in this scenario, the namespace is named app-monitoring

Scenario
--------

Create a new namespace

```sh
oc new-project simple-apb
```

Allow all namespaces to pull images from the apb namespace

```sh
oc adm policy add-role-to-group system:image-puller system:serviceaccounts -n simple-apb 
```

Build the sample application image in the simple-apb namespace
This image is a sample python project that will expose metrics on /metrics with two custom metrics ws_srv_func and ws_srv_is_now_even
The source code is available at https://github.com/christophefarges/flask-prometheus-ex

```sh
oc create -f sample-image
```

Configure the ansible-service-broker with the following

* set the role as admin as we will create a role in the namespace

```yaml
    openshift:
        ...
        sandbox_role: admin
```

* add the following registry to the ansible-service-broker

```yaml
    registry:
    -   name: localregistry
        namespaces:
        - simple-apb
        type: local_openshift
        white_list:
        - .*-apb
```

build the apb in this project

```sh
oc new-build --binary=true --name simple-apb -n simple-apb

oc start-build --follow --from-dir . simple-apb -n simple-apb
```

Allow all the serviceaccounts to create servicemonitors objects in the app-monitoring namespace

```sh
oc create clusterrole service-monitor-editor --verb=get,create,update,delete --resource=servicemonitors.monitoring.coreos.com -n app-monitoring                                                                                              ⏎
oc adm policy add-cluster-role-to-group service-monitor-editor system:serviceaccounts -n app-monitoring
```

Create a new simple-apb application from the service catalog, enable the monitoring and specify the namespace where prometheus in running (app-monitoring by default)


License
-------

BSD


