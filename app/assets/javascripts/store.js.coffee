# http://emberjs.com/guides/models/#toc_store
# http://emberjs.com/guides/models/pushing-records-into-the-store/

DS.RESTAdapter.reopen
  namespace: 'admin/api/v1'

Roomnhouse.ApplicationStore = DS.Store.extend()

# Override the default adapter with the `DS.ActiveModelAdapter` which
# is built to work nicely with the ActiveModel::Serializers gem.
Roomnhouse.ApplicationAdapter = DS.ActiveModelAdapter.extend()
