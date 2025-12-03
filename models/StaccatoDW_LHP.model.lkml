connection: "staccatodw"
# include all the views
include: "/views/**/*.view.lkml"


datagroup: StaccatoDW_LHP_default_datagroup {
  max_cache_age: "1 hour"
}
persist_with: StaccatoDW_LHP_default_datagroup

explore: vw_lhp_epicor_glaccount {
  label: "Precision GL Account"
  description: "LHP EPICOR Information"
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

explore: vw_lhp_epicor_v3_mag {
  label: "Precision V3 Magazines"
  description: "LHP EPICOR Information on Staccato V3 Magazines"
  group_label: "Staccato Precision"
}
