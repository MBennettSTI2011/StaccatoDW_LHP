view: vw_lhp_epicor_v3_mag {
  sql_table_name: dbo.vw_LHP_EPICOR_V3_Mag ;;

# --- Dimensions ---

  dimension: month {
    label: "Month"
    description: "The month associated with the production or shipping record."
    type: string
    sql: ${TABLE}.MONTH ;;
  }

  # --- Measures ---

  measure: count {
    label: "Count"
    type: count
  }

  measure: total_shipped_quantity {
    label: "Total Shipped Quantity"
    description: "Sum of shipped quantities."
    type: sum
    sql: ${TABLE}.InvcDtl_OurShipQty ;;
    value_format_name: decimal_0
  }

  measure: total_target_v3 {
    label: "Total Target V3"
    description: "Sum of V3 targets."
    type: sum
    sql: ${TABLE}.Target_V3 ;;
    value_format_name: decimal_0
  }

  measure: total_units_produced {
    label: "Total Units Produced"
    description: "Sum of units produced."
    type: sum
    sql: ${TABLE}.Units_Produced ;;
    value_format_name: decimal_0
  }
}
