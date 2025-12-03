view: vw_lhp_epicor_schuemann_barrels {
  sql_table_name: dbo.vw_LHP_EPICOR_SchuemannBarrels ;;

  # --- Primary Key ---
  dimension: pk_schuemann {
    primary_key: yes
    hidden: yes
    type: string
    sql: CONCAT(${part_tran_part_num}, '-', ${part_tran_tran_raw}) ;;
  }

  # --- Dimensions ---

  dimension: part_commercial_sub_brand {
    label: "Commercial Sub Brand"
    description: "The commercial sub-brand of the part."
    type: string
    sql: ${TABLE}.Part_CommercialSubBrand ;;
  }

  dimension: prod_grup_description {
    label: "Product Group"
    description: "Description of the product group."
    type: string
    sql: ${TABLE}.ProdGrup_Description ;;
  }

  # Grouping Part Transaction Details
  dimension: part_tran_bin_num {
    label: "Bin Number"
    group_label: "Part Transaction"
    description: "The bin number where the transaction occurred."
    type: string
    sql: ${TABLE}.PartTran_BinNum ;;
  }

  dimension: part_tran_part_num {
    label: "Part Number"
    group_label: "Part Transaction"
    description: "The part number involved in the transaction."
    type: string
    sql: ${TABLE}.PartTran_PartNum ;;
  }

  dimension_group: part_tran_tran {
    label: "Transaction Date"
    group_label: "Part Transaction"
    description: "Part Transcation Date"
    type: time
    timeframes: [raw, date, day_of_month, day_of_year, week, month, month_name, month_num, quarter, year]
    sql: ${TABLE}.PartTran_TranDate ;;
  }

  dimension: part_tran_tran_type {
    label: "Transaction Type"
    group_label: "Part Transaction"
    description: "The type of transaction (e.g., PUR-STK)."
    type: string
    sql: ${TABLE}.PartTran_TranType ;;
  }

  # --- Measures ---

  measure: count {
    label: "Count"
    type: count
    drill_fields: [part_tran_part_num, prod_grup_description]
  }

  measure: total_units_produced {
    label: "Total Units Produced"
    description: "Total count of units produced."
    type: sum
    sql: ${TABLE}.Units_Produced ;;
    value_format_name: decimal_0
  }

  measure: total_extended_cost {
    label: "Total Extended Cost"
    description: "The total extended cost of the transactions."
    type: sum
    # Casting to number as original view had this as string
    sql: CAST(${TABLE}.PartTran_ExtCost AS DECIMAL(18,2)) ;;
    value_format_name: usd
  }

  measure: average_material_unit_cost {
    label: "Avg Material Unit Cost"
    description: "Average unit cost for materials."
    type: average
    # Casting to number as original view had this as string
    sql: CAST(${TABLE}.PartTran_MtlUnitCost AS DECIMAL(18,2)) ;;
    value_format_name: usd
  }
}
