view: vw_lhp_epicor_shipping_for_rev {
  sql_table_name: dbo.vw_LHP_EPICOR_ShippingForRev ;;

# --- Primary Key ---
  dimension: pk_shipping {
    primary_key: yes
    hidden: yes
    type: string
    sql: CONCAT(${invc_dtl_part_num}, '-', ${invc_head_invoice_raw}) ;;
  }

  # --- Dimensions ---

  dimension: invc_dtl_part_num {
    label: "Part Number"
    description: "The specific part number on the invoice detail."
    type: string
    sql: ${TABLE}.InvcDtl_PartNum ;;
  }

  dimension_group: invc_head_invoice {
    label: "Invoice"
    description: "The date the invoice was created."
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.InvcHead_InvoiceDate ;;
  }

  dimension: prod_grup_description {
    label: "Product Group"
    description: "Description of the product group associated with the item."
    type: string
    sql: ${TABLE}.ProdGrup_Description ;;
  }

  # --- Measures ---

  measure: count {
    label: "Count"
    type: count
    drill_fields: [invc_dtl_part_num, prod_grup_description]
  }

  measure: total_extended_price {
    label: "Total Extended Price"
    description: "Total calculated extended price."
    type: sum
    sql: ${TABLE}.Calculated_ExtendedPriceCalc ;;
    value_format_name: usd
  }

  measure: total_shipped_quantity {
    label: "Total Shipped Quantity"
    description: "Total quantity shipped from invoice details."
    type: sum
    sql: ${TABLE}.InvcDtl_OurShipQty ;;
    value_format_name: decimal_0
  }

  measure: average_extended_price {
    label: "Average Extended Price"
    type: average
    sql: ${TABLE}.Calculated_ExtendedPriceCalc ;;
    value_format_name: usd
  }
}
