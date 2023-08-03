#!/bin/bash
mapshaper neighborhoods.geojson -simplify dp 50% -o precision=0.0001 neighborhoods.svg
