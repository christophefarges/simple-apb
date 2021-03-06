FROM ansibleplaybookbundle/apb-base

LABEL "com.redhat.apb.spec"=\
"dmVyc2lvbjogMS4wCm5hbWU6IHNpbXBsZS1hcGIKZGVzY3JpcHRpb246IHlvdXIgZGVzY3JpcHRp\
b24KYmluZGFibGU6IEZhbHNlCmFzeW5jOiBvcHRpb25hbAptZXRhZGF0YToKICBkaXNwbGF5TmFt\
ZTogc2ltcGxlLWFwYgpwbGFuczoKICAtIG5hbWU6IGRlZmF1bHQKICAgIGRlc2NyaXB0aW9uOiBU\
aGlzIGRlZmF1bHQgcGxhbiBkZXBsb3lzIHNpbXBsZS1hcGIKICAgIHVwZGF0ZXNfdG86CiAgICAt\
IGRlZmF1bHQKICAgIGZyZWU6IFRydWUKICAgIG1ldGFkYXRhOiB7fQogICAgcGFyYW1ldGVyczog\
CiAgICAgIC0gbmFtZTogZW5hYmxlX21vbml0b3JpbmcKICAgICAgICB0eXBlOiBib29sZWFuCiAg\
ICAgICAgZGVmYXVsdDogZmFsc2UKICAgICAgICByZXF1aXJlZDogZmFsc2UKICAgICAgICB0aXRs\
ZTogIkVuYWJsZSBQcm9tZXRoZXVzIG1vbml0b3JpbmciCiAgICAgIC0gbmFtZTogbW9uaXRvcmlu\
Z19uYW1lc3BhY2UKICAgICAgICB0eXBlOiBzdHJpbmcKICAgICAgICB1cGRhdGV0YWJsZTogdHJ1\
ZQogICAgICAgIHRpdGxlOiAiQXBwbGljYXRpb24gbW9uaXRvcmluZyBuYW1lc3BhY2UiCiAgICAg\
ICAgZGVzY3JpcHRpb246ICIiCiAgICAgICAgZGVmYXVsdDogYXBwLW1vbml0b3JpbmcKICAgICAg\
ICByZXF1aXJlZDogZmFsc2U="

COPY playbooks /opt/apb/project
COPY role /opt/ansible/roles/simple-apb
RUN chmod -R g=u /opt/{ansible,apb}
USER apb