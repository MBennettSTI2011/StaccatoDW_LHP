# The name of this view in Looker is "Vw Lhp Epicor V3 Mag"
view: vw_lhp_epicor_v3_mag {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: dbo.vw_LHP_EPICOR_V3_Mag ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Invc Dtl Our Ship Qty" in Explore.

  dimension: invc_dtl_our_ship_qty {
    type: number
    sql: ${TABLE}.InvcDtl_OurShipQty ;;
  }

  dimension: month {
    type: string
    sql: ${TABLE}.MONTH ;;
  }

  dimension: target_v3 {
    type: number
    sql: ${TABLE}.Target_V3 ;;
  }

  dimension: units_produced {
    type: number
    sql: ${TABLE}.Units_Produced ;;
  }
  measure: count {
    type: count
  }
}
