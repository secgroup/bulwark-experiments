# Bulwark Monitors

## Ideal Specifications

The ideal specifications are provided in the [specifications](./specifications) folder. 
Each specification is defined using our [customized version](./specifications/webspi_custom.pvl) of the WebSpi library 

### Running ProVerif

The `proverif_wrapper.sh` script simplifies ProVerif output by showing only color-coded RESULT lines from the ProVerif invocation.

```sh
./proverif_wrapper.sh -lib webspi_custom.pvl oauth.pv
```

## Executable Monitors

The [monitors](./monitors) folder contains the generated monitors. 
For each monitor we provide the pi-calculus model, the generated code in the target language, and a configuration file.
