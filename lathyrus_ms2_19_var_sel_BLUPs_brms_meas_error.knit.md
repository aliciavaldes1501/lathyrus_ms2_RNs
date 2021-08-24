
<!-- rnb-text-begin -->

---
title: "Lathyrus ms2: selection on reaction norms for flowering time"
subtitle: "Variation in selection among years using BLUPs - brms models"
author : "Alicia Valdés"
output:
  pdf_document:
    toc: yes
    toc_depth: 4
  html_notebook:
    toc: yes
    toc_depth: '4'
    latex_engine: xelatex
editor_options:
  chunk_output_type: inline
---


<!-- rnb-text-end -->



<!-- rnb-text-begin -->



<!-- rnb-text-end -->



<!-- rnb-text-begin -->



<!-- rnb-text-end -->



<!-- rnb-text-begin -->



<!-- rnb-text-end -->



<!-- rnb-text-begin -->


# Read data


<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuZGF0YWRlZl9CTFVQczwtcmVhZC5jc3YoXCJkYXRhL2RhdGFkZWZfQkxVUHMuY3N2XCIpIFxuaGVhZChkYXRhZGVmX0JMVVBzKVxuYGBgIn0= -->

```r
datadef_BLUPs<-read.csv("data/datadef_BLUPs.csv") 
head(datadef_BLUPs)
```

<!-- rnb-source-end -->

<!-- rnb-frame-begin eyJtZXRhZGF0YSI6eyJjbGFzc2VzIjpbImRhdGEuZnJhbWUiXSwibnJvdyI6NiwibmNvbCI6MjIsInN1bW1hcnkiOnsiRGVzY3JpcHRpb24iOlsiZGYgWzYgeCAyMl0iXX19LCJyZGYiOiJINHNJQUFBQUFBQUFCZ3R5aVREbWl1QmlZR0JnWm1CaEJKS3NRQ1lEbTNPQW9aR3BFUU1EQ3hPUXg4akF3c0FKb2l1QThzSkFoaGdRODRLVU1UQ3dId1hpWTBCOEhJaFBBUEZKSUQ2RmtBZHF4bzRGd1BJUWcxbnpjMUxpRFNubm9OcktnTVZXUHBCOC9RZVFGUHNpR08zZysyVWJkOEkySVFmdnF4dWlXVGVFSXNTbjkxazg3ck9CNlhPUVlFQUJEdVpRMmhoQ3cvWHB3SlhBM01NTTVZTm9KaVMzUWN4VlFETlhBMHFqMjhjQloySjNEMVNmL1FjQytxWnBwWUdBUTBQa1RDQ1k1VEQzTFlTZWR1RklxT0tzRm9mdVdzUGJMbkZYSGFhODJuQTdTNjZKQVRXMm1JR0JUUzRURVNLc09EQk1uZ01IaHZoQTVGUEVmdFh1Ync0eXg5ZUpWRDMwY0JENTlkQjluVWkxQTkrQ1hDdTJ5ek1kUkc4QXBUL0ZPRWl1aVo5MDlLY21UTi8rczZZdkZ3WnkzN0gvdlc2R29yYng2ZjFuVkc1TXNQL3R2UCtYdnV1ZVRhdVU5bWU1bXlyeUgvOWwvNjVwajhsNnRibHdmYy9YVnJWN0pNZ1JTOFAwMlg4dEZIbGVXbkNWV0JwdTM4bnJuSDczazFTSnBlSDJQWnQzd3YwVDgxWmlhWGg0c2tGVENwRTBYSi9nVEVqS0laS0c2K1BtQyt0b3lYOUJMSTFXRUxIbUplYW1Ga09UcFJoVWtLVXlOYkVJcGlBekpUNFB4bUhLaENWQjFyVGsvSlJVV0hwMGMzT0JhYzJMVDh0QllzTjBzcGZrbHhTbnBzSzBjMlhtbFNRbUk0dHdGbWZrNTVmRWwrWERkTE1WcEJabDVzT2toZkxpUVk0cUJwb2VuNVpaa3BkYVhBeVY0WVhKRkplVXBsVENOT2VtSnViRm04QXNUMGJoY2dJdFR5MUtUaTBvZ1Fyd3dBWGlpK0VlTE03Skw0QjVrQVBNUVVnS2djMkR1Z1BGWW40VUdYaFFpQ1hueGNNOUdBOVdVMXhZVklJV0daeEYrZVY2c0FnQjVWNm1Ca2dLWVVPUHRlU2N4R0pZck1FRXVWSVNTeEwxMG9xQStvRzhmMmhhMlBNTFNqTHo4NENhbUlTaCtaK0xBVkdhdzlnTWFHeGtDeGlMMEFUNFMvTkFyazNSVGM0b3pjdldOVVF6a3hkS3N5R3h4U0RPWXZvUE5Zb0RsbFpTa3pQeVlVNHRUeXpLeTh4TGgzR0I0VkdjbUE2TEM3YlV2UFRNUEJpUE5TY3hLUlVXeW56QThBTUhuMTVCRVRCS1llRUNGQzNXQTZhL1JKZzZydVQ4SEpnSU9LUVkvZ0VBcWNqeEZiMEhBQUE9In0= -->

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":[""],"name":["_rn_"],"type":[""],"align":["left"]},{"label":["year"],"name":[1],"type":["int"],"align":["right"]},{"label":["id_nr"],"name":[2],"type":["int"],"align":["right"]},{"label":["id"],"name":[3],"type":["chr"],"align":["left"]},{"label":["fcode"],"name":[4],"type":["int"],"align":["right"]},{"label":["FFD"],"name":[5],"type":["dbl"],"align":["right"]},{"label":["n_fl"],"name":[6],"type":["dbl"],"align":["right"]},{"label":["n_fr"],"name":[7],"type":["int"],"align":["right"]},{"label":["totseed"],"name":[8],"type":["dbl"],"align":["right"]},{"label":["intactseed"],"name":[9],"type":["dbl"],"align":["right"]},{"label":["shoot_vol"],"name":[10],"type":["dbl"],"align":["right"]},{"label":["period"],"name":[11],"type":["chr"],"align":["left"]},{"label":["n_years_fl_fitness"],"name":[12],"type":["int"],"align":["right"]},{"label":["n_years_study"],"name":[13],"type":["int"],"align":["right"]},{"label":["mean_4"],"name":[14],"type":["dbl"],"align":["right"]},{"label":["cmean_4"],"name":[15],"type":["dbl"],"align":["right"]},{"label":["intercept"],"name":[16],"type":["dbl"],"align":["right"]},{"label":["intercept_sd"],"name":[17],"type":["dbl"],"align":["right"]},{"label":["slope"],"name":[18],"type":["dbl"],"align":["right"]},{"label":["slope_sd"],"name":[19],"type":["dbl"],"align":["right"]},{"label":["mean_fitness_study"],"name":[20],"type":["dbl"],"align":["right"]},{"label":["mean_fitness_fl"],"name":[21],"type":["dbl"],"align":["right"]},{"label":["cn_shoot_vol_mean_sqrt"],"name":[22],"type":["dbl"],"align":["right"]}],"data":[{"1":"1989","2":"1","3":"old_1","4":"1","5":"NA","6":"6","7":"3","8":"8","9":"6","10":"1418.6000","11":"old","12":"5","13":"8","14":"5.236667","15":"-0.228207783","16":"-0.7399266","17":"1.340108","18":"-0.2018749","19":"0.7068826","20":"2.75","21":"4.4","22":"3.382001","_rn_":"1"},{"1":"1990","2":"1","3":"old_1","4":"0","5":"NA","6":"0","7":"0","8":"0","9":"0","10":"523.2000","11":"old","12":"5","13":"8","14":"7.195000","15":"1.730125551","16":"-0.7399266","17":"1.340108","18":"-0.2018749","19":"0.7068826","20":"2.75","21":"4.4","22":"3.382001","_rn_":"2"},{"1":"1991","2":"1","3":"old_1","4":"1","5":"59.91181","6":"23","7":"3","8":"12","9":"12","10":"1915.4000","11":"old","12":"5","13":"8","14":"5.245000","15":"-0.219874449","16":"-0.7399266","17":"1.340108","18":"-0.2018749","19":"0.7068826","20":"2.75","21":"4.4","22":"3.382001","_rn_":"3"},{"1":"1992","2":"1","3":"old_1","4":"1","5":"55.66944","6":"19","7":"2","8":"6","9":"1","10":"1460.1917","11":"old","12":"5","13":"8","14":"3.828333","15":"-1.636541116","16":"-0.7399266","17":"1.340108","18":"-0.2018749","19":"0.7068826","20":"2.75","21":"4.4","22":"3.382001","_rn_":"4"},{"1":"1993","2":"1","3":"old_1","4":"1","5":"NA","6":"NA","7":"0","8":"0","9":"0","10":"879.6493","11":"old","12":"5","13":"8","14":"5.461667","15":"-0.003207783","16":"-0.7399266","17":"1.340108","18":"-0.2018749","19":"0.7068826","20":"2.75","21":"4.4","22":"3.382001","_rn_":"5"},{"1":"1994","2":"1","3":"old_1","4":"1","5":"59.18403","6":"14","7":"1","8":"3","9":"3","10":"1338.6727","11":"old","12":"5","13":"8","14":"6.418333","15":"0.953458884","16":"-0.7399266","17":"1.340108","18":"-0.2018749","19":"0.7068826","20":"2.75","21":"4.4","22":"3.382001","_rn_":"6"}],"options":{"columns":{"min":{},"max":[10],"total":[22]},"rows":{"min":[10],"max":[10],"total":[6]},"pages":{}}}
  </script>
</div>

<!-- rnb-frame-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->


# Models with brms


<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxubXkuY29yZXMgPC0gZGV0ZWN0Q29yZXMoKVxuYGBgIn0= -->

```r
my.cores <- detectCores()
```

<!-- rnb-source-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->


Does selection on plasticity depend on temperature when considering also plant size?

Trying different distributions and models with and without zero-inflation


<!-- rnb-text-end -->



<!-- rnb-text-begin -->


### Model summary and predictions


<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxucHJpbnQobW9kZWxCTFVQXzJfM19icm1zLGRpZ2l0cz0zKVxuYGBgIn0= -->

```r
print(modelBLUP_2_3_brms,digits=3)
```

<!-- rnb-source-end -->

<!-- rnb-output-begin eyJkYXRhIjoiIEZhbWlseTogemVyb19pbmZsYXRlZF9uZWdiaW5vbWlhbCBcbiAgTGlua3M6IG11ID0gbG9nOyBzaGFwZSA9IGlkZW50aXR5OyB6aSA9IGxvZ2l0IFxuRm9ybXVsYTogcm91bmQoaW50YWN0c2VlZCkgfiBzbG9wZSAqIGNtZWFuXzQgKyBjbl9zaG9vdF92b2xfbWVhbl9zcXJ0ICsgKDEgfCBpZCkgXG4gICAgICAgICB6aSB+IHNsb3BlICogY21lYW5fNCArIGNuX3Nob290X3ZvbF9tZWFuX3NxcnQgKyAoMSB8IGlkKVxuICAgRGF0YTogZGF0YWRlZl9CTFVQcyAoTnVtYmVyIG9mIG9ic2VydmF0aW9uczogNDUyMSkgXG5TYW1wbGVzOiA0IGNoYWlucywgZWFjaCB3aXRoIGl0ZXIgPSA0MDAwOyB3YXJtdXAgPSAxMDAwOyB0aGluID0gMjtcbiAgICAgICAgIHRvdGFsIHBvc3Qtd2FybXVwIHNhbXBsZXMgPSA2MDAwXG5cbkdyb3VwLUxldmVsIEVmZmVjdHM6IFxufmlkIChOdW1iZXIgb2YgbGV2ZWxzOiA3OTEpIFxuICAgICAgICAgICAgICAgICBFc3RpbWF0ZSBFc3QuRXJyb3IgbC05NSUgQ0kgdS05NSUgQ0kgIFJoYXQgQnVsa19FU1MgVGFpbF9FU1NcbnNkKEludGVyY2VwdCkgICAgICAgMC4yNDggICAgIDAuMDQ1ICAgIDAuMTU1ICAgIDAuMzMxIDEuMDAwICAgICAzMDYwICAgICAzODQ0XG5zZCh6aV9JbnRlcmNlcHQpICAgIDAuMTgxICAgICAwLjA5OSAgICAwLjAxMSAgICAwLjM2NyAxLjAwMSAgICAgMTU2OCAgICAgMzM3NlxuXG5Qb3B1bGF0aW9uLUxldmVsIEVmZmVjdHM6IFxuICAgICAgICAgICAgICAgICAgICAgICAgICBFc3RpbWF0ZSBFc3QuRXJyb3IgbC05NSUgQ0kgdS05NSUgQ0kgIFJoYXQgQnVsa19FU1NcbkludGVyY2VwdCAgICAgICAgICAgICAgICAgICAgMi4xNDcgICAgIDAuMDMzICAgIDIuMDgyICAgIDIuMjExIDEuMDAyICAgICA0NTg3XG56aV9JbnRlcmNlcHQgICAgICAgICAgICAgICAgIDEuMDA5ICAgICAwLjAzOSAgICAwLjkzNCAgICAxLjA4OCAxLjAwMCAgICAgNDQ1N1xuc2xvcGUgICAgICAgICAgICAgICAgICAgICAgICAwLjA0MCAgICAgMC4wNzIgICAtMC4wOTggICAgMC4xODUgMS4wMDAgICAgIDQ5NzBcbmNtZWFuXzQgICAgICAgICAgICAgICAgICAgICAtMC4wMDkgICAgIDAuMDI3ICAgLTAuMDY0ICAgIDAuMDQ0IDEuMDAwICAgICA1MzI1XG5jbl9zaG9vdF92b2xfbWVhbl9zcXJ0ICAgICAgIDAuMDE4ICAgICAwLjAwMiAgICAwLjAxNCAgICAwLjAyMyAxLjAwMSAgICAgNDc5MFxuc2xvcGU6Y21lYW5fNCAgICAgICAgICAgICAgICAwLjAzMSAgICAgMC4wNTcgICAtMC4wODAgMS4wMDEgICAgIDQ4MDlcbnppX2NtZWFuXzQgICAgICAgICAgICAgICAgICAgMC4wOTAgICAgIDAuMDI5ICAgIDAuMDMzICAgIDAuMTQ3IDEuMDAwICAgICA1MzIyXG56aV9jbl9zaG9vdF92b2xfbWVhbl9zcXJ0ICAgLTAuMDQwICAgICAwLjAwMyAgIC0wLjA0NiAgIC0wLjAzNCAxLjAwMSAgICAgNDYzN1xuemlfc2xvcGU6Y21lYW5fNCAgICAgICAgICAgICAwLjEzMSAgICAgMC4wNjYgICAgMC4wMDIgICAgMC4yNjIgMS4wMDAgICAgIDU2MDFcbiAgICAgICAgICAgICAgICAgICAgICAgICAgVGFpbF9FU1NcbkludGVyY2VwdCAgICAgICAgICAgICAgICAgICAgIDU0MDZcbnppX0ludGVyY2VwdCAgICAgICAgICAgICAgICAgIDQ5NjFcbnNsb3BlICAgICAgICAgICAgICAgICAgICAgICAgIDUyMTdcbmNtZWFuXzQgICAgICAgICAgICAgICAgICAgICAgIDQ5NzdcbmNuX3Nob290X3ZvbF9tZWFuX3NxcnQgICAgICAgIDUwMDlcbnNsb3BlOmNtZWFuXzQgICAgICAgICAgICAgICAgIDU0MDhcbnppX3Nsb3BlICAgICAgICAgICAgICAgICAgICAgIDUyMjVcbnppX2NtZWFuXzQgICAgICAgICAgICAgICAgICAgIDQzNDFcbnppX2NuX3Nob290X3ZvbF9tZWFuX3NxcnQgICAgIDQ5MjZcbnppX3Nsb3BlOmNtZWFuXzQgICAgICAgICAgICAgIDUxNDhcblxuRmFtaWx5IFNwZWNpZmljIFBhcmFtZXRlcnM6IFxuICAgICAgRXN0aW1hdGUgRXN0LkVycm9yIGwtOTUlIENJIHUtOTUlIENJICBSaGF0IEJ1bGtfRVNTIFRhaWxfRVNTXG5zaGFwZSAgICAxLjUyOSAgICAgMC4xMTEgICAgMS4zMjcgICAgMS43NTkgMS4wMDAgICAgIDM4NjkgICAgIDQzOTBcblxuU2FtcGxlcyB3ZXJlIGRyYXduIHVzaW5nIHNhbXBsaW5nKE5VVFMpLiBGb3IgZWFjaCBwYXJhbWV0ZXIsIEJ1bGtfRVNTXG5hbmQgVGFpbF9FU1MgYXJlIGVmZmVjdGl2ZSBzYW1wbGUgc2l6ZSBtZWFzdXJlcywgYW5kIFJoYXQgaXMgdGhlIHBvdGVudGlhbFxuc2NhbGUgcmVkdWN0aW9uIGZhY3RvciBvbiBzcGxpdCBjaGFpbnMgKGF0IGNvbnZlcmdlbmNlLCBSaGF0ID0gMSkuXG4ifQ== -->

```
 Family: zero_inflated_negbinomial 
  Links: mu = log; shape = identity; zi = logit 
Formula: round(intactseed) ~ slope * cmean_4 + cn_shoot_vol_mean_sqrt + (1 | id) 
         zi ~ slope * cmean_4 + cn_shoot_vol_mean_sqrt + (1 | id)
   Data: datadef_BLUPs (Number of observations: 4521) 
Samples: 4 chains, each with iter = 4000; warmup = 1000; thin = 2;
         total post-warmup samples = 6000

Group-Level Effects: 
~id (Number of levels: 791) 
                 Estimate Est.Error l-95% CI u-95% CI  Rhat Bulk_ESS Tail_ESS
sd(Intercept)       0.248     0.045    0.155    0.331 1.000     3060     3844
sd(zi_Intercept)    0.181     0.099    0.011    0.367 1.001     1568     3376

Population-Level Effects: 
                          Estimate Est.Error l-95% CI u-95% CI  Rhat Bulk_ESS
Intercept                    2.147     0.033    2.082    2.211 1.002     4587
zi_Intercept                 1.009     0.039    0.934    1.088 1.000     4457
slope                        0.040     0.072   -0.098    0.185 1.000     4970
cmean_4                     -0.009     0.027   -0.064    0.044 1.000     5325
cn_shoot_vol_mean_sqrt       0.018     0.002    0.014    0.023 1.001     4790
slope:cmean_4                0.031     0.057   -0.080 1.001     4809
zi_cmean_4                   0.090     0.029    0.033    0.147 1.000     5322
zi_cn_shoot_vol_mean_sqrt   -0.040     0.003   -0.046   -0.034 1.001     4637
zi_slope:cmean_4             0.131     0.066    0.002    0.262 1.000     5601
                          Tail_ESS
Intercept                     5406
zi_Intercept                  4961
slope                         5217
cmean_4                       4977
cn_shoot_vol_mean_sqrt        5009
slope:cmean_4                 5408
zi_slope                      5225
zi_cmean_4                    4341
zi_cn_shoot_vol_mean_sqrt     4926
zi_slope:cmean_4              5148

Family Specific Parameters: 
      Estimate Est.Error l-95% CI u-95% CI  Rhat Bulk_ESS Tail_ESS
shape    1.529     0.111    1.327    1.759 1.000     3869     4390

Samples were drawn using sampling(NUTS). For each parameter, Bulk_ESS
and Tail_ESS are effective sample size measures, and Rhat is the potential
scale reduction factor on split chains (at convergence, Rhat = 1).
```



<!-- rnb-output-end -->

<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxucHJpbnQobW9kZWxCTFVQXzJfNF9icm1zLGRpZ2l0cz0zKVxuYGBgIn0= -->

```r
print(modelBLUP_2_4_brms,digits=3)
```

<!-- rnb-source-end -->

<!-- rnb-output-begin eyJkYXRhIjoiIEZhbWlseTogemVyb19pbmZsYXRlZF9uZWdiaW5vbWlhbCBcbiAgTGlua3M6IG11ID0gbG9nOyBzaGFwZSA9IGlkZW50aXR5OyB6aSA9IGxvZ2l0IFxuRm9ybXVsYTogcm91bmQoaW50YWN0c2VlZCkgfiBtZShzbG9wZSwgc2xvcGVfc2QpICogY21lYW5fNCArIGNuX3Nob290X3ZvbF9tZWFuX3NxcnQgKyAoMSB8IGlkKSBcbiAgICAgICAgIHppIH4gbWUoc2xvcGUsIHNsb3BlX3NkKSAqIGNtZWFuXzQgKyBjbl9zaG9vdF92b2xfbWVhbl9zcXJ0ICsgKDEgfCBpZClcbiAgIERhdGE6IGRhdGFkZWZfQkxVUHMgKE51bWJlciBvZiBvYnNlcnZhdGlvbnM6IDQ1MjEpIFxuU2FtcGxlczogNCBjaGFpbnMsIGVhY2ggd2l0aCBpdGVyID0gNTAwMDsgd2FybXVwID0gMTAwMDsgdGhpbiA9IDI7XG4gICAgICAgICB0b3RhbCBwb3N0LXdhcm11cCBzYW1wbGVzID0gODAwMFxuXG5Hcm91cC1MZXZlbCBFZmZlY3RzOiBcbn5pZCAoTnVtYmVyIG9mIGxldmVsczogNzkxKSBcbiAgICAgICAgICAgICAgICAgRXN0aW1hdGUgRXN0LkVycm9yIGwtOTUlIENJIHUtOTUlIENJICBSaGF0IEJ1bGtfRVNTIFRhaWxfRVNTXG5zZChJbnRlcmNlcHQpICAgICAgIDAuMjczICAgICAwLjA0NSAgICAwLjE3OCAgICAwLjM1NiAxLjAwMyAgICAgMTgxMiAgICAgMjg5OVxuc2QoemlfSW50ZXJjZXB0KSAgICAwLjUxNSAgICAgMC4xNjkgICAgMC4xMzMgICAgMC44MzcgMS4wMDggICAgICA1MzAgICAgICA2NjFcblxuUG9wdWxhdGlvbi1MZXZlbCBFZmZlY3RzOiBcbiAgICAgICAgICAgICAgICAgICAgICAgICAgICBFc3RpbWF0ZSBFc3QuRXJyb3IgICAgbC05NSUgQ0kgIHUtOTUlIENJICBSaGF0IEJ1bGtfRVNTXG5JbnRlcmNlcHQgICAgICAgICAgICAgICAgICAgICAgMi4yNzAgICAgIDAuMDk5ICAgICAgIDIuMDYyICAgICAyLjQ2MyAxLjAxMCAgICAgMjU5OVxuemlfSW50ZXJjZXB0ICAgICAgICAgICAgICAgICAgLTAuMDQzICAgICAxLjgxMCAgICAgIC0zLjc1NyAgICAgMy41ODIgMS4wMDYgICAgIDI3MTBcbmNtZWFuXzQgICAgICAgICAgICAgICAgICAgICAgICAwLjE2OCAgICAgMC40ODEgICAgICAtMC43NDcgICAgIDEuMTkyIDEuMDA2ICAgICAyMDQyXG5jbl9zaG9vdF92b2xfbWVhbl9zcXJ0ICAgICAgICAgMC4wMTQgICAgIDAuMDAyICAgICAgIDAuMDEwICAgICAwLjAxOSAxLjAwOCAgICAgIDY0MlxuemlfY21lYW5fNCAgICAgICAgICAgICAgICAgICAgIDAuODM0ICAgICAxLjA0MyAgICAgIC0xLjIxNyAgICAgMi45ODcgMS4wMTEgICAgICAzODdcbm1lc2xvcGVzbG9wZV9zZCAgICAgICAgICAgICAtMjExLjkzOCAgMjExMC40MjIgICAtNDY5MS43MjEgIDQwMTguODIxIDEuMzI2ICAgICAgIDEzXG5tZXNsb3Blc2xvcGVfc2Q6Y21lYW5fNCAgICAgIDU3Mi4zMTkgMTQ5NDcuOTk2ICAtMTU2OTYuODQzIDM1NDM5LjQ2NSAyLjE4NyAgICAgICAgNVxuemlfbWVzbG9wZXNsb3BlX3NkICAgICAgICAgLTIwMzYuNTI4IDYxMDE5LjE5OCAtMTQ3MDgxLjg3OSA2NzIxMS42NTcgMi4yNjMgICAgICAgIDVcbnppX21lc2xvcGVzbG9wZV9zZDpjbWVhbl80ICAxMTUyLjk3NSAzMzgzMi4yMjggIC0zNjc3MC42MjkgODExMTguMTY1IDIuMjE1XG5jbWVhbl80ICAgICAgICAgICAgICAgICAgICAgICAgMjY2MlxuY25fc2hvb3Rfdm9sX21lYW5fc3FydCAgICAgICAgIDI0MjdcbnppX2NtZWFuXzQgICAgICAgICAgICAgICAgICAgICAzMTE4XG56aV9jbl9zaG9vdF92b2xfbWVhbl9zcXJ0ICAgICAgIDgzM1xubWVzbG9wZXNsb3BlX3NkICAgICAgICAgICAgICAgICAgNzhcbm1lc2xvcGVzbG9wZV9zZDpjbWVhbl80ICAgICAgICAgIDQ2XG56aV9tZXNsb3Blc2xvcGVfc2QgICAgICAgICAgICAgICAzM1xuemlfbWVzbG9wZXNsb3BlX3NkOmNtZWFuXzQgICAgICAgMzlcblxuRmFtaWx5IFNwZWNpZmljIFBhcmFtZXRlcnM6IFxuICAgICAgRXN0aW1hdGUgRXN0LkVycm9yIGwtOTUlIENJIHUtOTUlIENJICBSaGF0IEJ1bGtfRVNTIFRhaWxfRVNTXG5zaGFwZSAgICAyLjMyNiAgICAgMC4yNjMgICAgMS44NzcgICAgMi45MTEgMS4wMTUgICAgICAzOTIgICAgICA0NDVcblxuU2FtcGxlcyB3ZXJlIGRyYXduIHVzaW5nIHNhbXBsaW5nKE5VVFMpLiBGb3IgZWFjaCBwYXJhbWV0ZXIsIEJ1bGtfRVNTXG5hbmQgVGFpbF9FU1MgYXJlIGVmZmVjdGl2ZSBzYW1wbGUgc2l6ZSBtZWFzdXJlcywgYW5kIFJoYXQgaXMgdGhlIHBvdGVudGlhbFxuc2NhbGUgcmVkdWN0aW9uIGZhY3RvciBvbiBzcGxpdCBjaGFpbnMgKGF0IGNvbnZlcmdlbmNlLCBSaGF0ID0gMSkuXG4ifQ== -->

```
 Family: zero_inflated_negbinomial 
  Links: mu = log; shape = identity; zi = logit 
Formula: round(intactseed) ~ me(slope, slope_sd) * cmean_4 + cn_shoot_vol_mean_sqrt + (1 | id) 
         zi ~ me(slope, slope_sd) * cmean_4 + cn_shoot_vol_mean_sqrt + (1 | id)
   Data: datadef_BLUPs (Number of observations: 4521) 
Samples: 4 chains, each with iter = 5000; warmup = 1000; thin = 2;
         total post-warmup samples = 8000

Group-Level Effects: 
~id (Number of levels: 791) 
                 Estimate Est.Error l-95% CI u-95% CI  Rhat Bulk_ESS Tail_ESS
sd(Intercept)       0.273     0.045    0.178    0.356 1.003     1812     2899
sd(zi_Intercept)    0.515     0.169    0.133    0.837 1.008      530      661

Population-Level Effects: 
                            Estimate Est.Error    l-95% CI  u-95% CI  Rhat Bulk_ESS
Intercept                      2.270     0.099       2.062     2.463 1.010     2599
zi_Intercept                  -0.043     1.810      -3.757     3.582 1.006     2710
cmean_4                        0.168     0.481      -0.747     1.192 1.006     2042
cn_shoot_vol_mean_sqrt         0.014     0.002       0.010     0.019 1.008      642
zi_cmean_4                     0.834     1.043      -1.217     2.987 1.011      387
meslopeslope_sd             -211.938  2110.422   -4691.721  4018.821 1.326       13
meslopeslope_sd:cmean_4      572.319 14947.996  -15696.843 35439.465 2.187        5
zi_meslopeslope_sd         -2036.528 61019.198 -147081.879 67211.657 2.263        5
zi_meslopeslope_sd:cmean_4  1152.975 33832.228  -36770.629 81118.165 2.215
cmean_4                        2662
cn_shoot_vol_mean_sqrt         2427
zi_cmean_4                     3118
zi_cn_shoot_vol_mean_sqrt       833
meslopeslope_sd                  78
meslopeslope_sd:cmean_4          46
zi_meslopeslope_sd               33
zi_meslopeslope_sd:cmean_4       39

Family Specific Parameters: 
      Estimate Est.Error l-95% CI u-95% CI  Rhat Bulk_ESS Tail_ESS
shape    2.326     0.263    1.877    2.911 1.015      392      445

Samples were drawn using sampling(NUTS). For each parameter, Bulk_ESS
and Tail_ESS are effective sample size measures, and Rhat is the potential
scale reduction factor on split chains (at convergence, Rhat = 1).
```



<!-- rnb-output-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->





<!-- rnb-text-end -->


