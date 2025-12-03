connection: "staccatodw"
# include all the views
include: "/views/**/*.view.lkml"


datagroup: StaccatoDW_LHP_default_datagroup {
  max_cache_age: "12 hours"
}
persist_with: StaccatoDW_LHP_default_datagroup

explore: vw_lhp_epicor_glaccount {
  label: "Precision GL Account"
  description: "LHP 2024 EPICOR Information"
  group_label: "Staccato Precision"
}

explore: vw_lhp_epicor_schuemann_barrels {
  label: "Precision Schuemann Barrels"
  description: "LHP EPICOR information on Schuemann Barrels"
  group_label: "Staccato Precision"
}

explore: vw_lhp_epicor_shipping_for_rev {
  label: "Precision Sales"
  description: "LHP EPICOR Sales Information"
  group_label: "Staccato Precision"
}
