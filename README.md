## install blueprint


```
cbd util cloudbreak-shell-quiet <<< "blueprint create --name prometheus-demo-2 --description prometheus-demo --url https://raw.githubusercontent.com/sequenceiq/prometheus-demo/master/demo.blueprint"

```

## load file into Consul kv store

```
cat x | curl -s "http://192.168.64.32:8500/v1/kv/config/application/cb/test" -X PUT --data-binary  @-
```


