# The name of this view in Looker is "Vw Lhp Epicor Shipping for Rev"
view: vw_lhp_epicor_shipping_for_rev {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: dbo.vw_LHP_EPICOR_ShippingForRev ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Calculated Extended Price Calc" in Explore.

  dimension: calculated_extended_price_calc {
    type: number
    sql: ${TABLE}.Calculated_ExtendedPriceCalc ;;
  }

  dimension: invc_dtl_our_ship_qty {
    type: number
    sql: ${TABLE}.InvcDtl_OurShipQty ;;
  }

  dimension: invc_dtl_part_num {
    type: string
    sql: ${TABLE}.InvcDtl_PartNum ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: invc_head_invoice {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.InvcHead_InvoiceDate ;;
  }

  dimension: prod_grup_description {
    type: string
    sql: ${TABLE}.ProdGrup_Description ;;
  }
  measure: count {
    type: count
  }
}
