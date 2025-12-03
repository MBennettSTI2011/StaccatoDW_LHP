# The name of this view in Looker is "Vw Lhp Epicor Schuemann Barrels"
view: vw_lhp_epicor_schuemann_barrels {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: dbo.vw_LHP_EPICOR_SchuemannBarrels ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Part Commercial Sub Brand" in Explore.

  dimension: part_commercial_sub_brand {
    type: string
    sql: ${TABLE}.Part_CommercialSubBrand ;;
  }

  dimension: part_tran_bin_num {
    type: string
    sql: ${TABLE}.PartTran_BinNum ;;
  }

  dimension: part_tran_ext_cost {
    type: string
    sql: ${TABLE}.PartTran_ExtCost ;;
  }

  dimension: part_tran_mtl_unit_cost {
    type: string
    sql: ${TABLE}.PartTran_MtlUnitCost ;;
  }

  dimension: part_tran_part_num {
    type: string
    sql: ${TABLE}.PartTran_PartNum ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: part_tran_tran {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.PartTran_TranDate ;;
  }

  dimension: part_tran_tran_type {
    type: string
    sql: ${TABLE}.PartTran_TranType ;;
  }

  dimension: prod_grup_description {
    type: string
    sql: ${TABLE}.ProdGrup_Description ;;
  }

  dimension: units_produced {
    type: number
    sql: ${TABLE}.Units_Produced ;;
  }
  measure: count {
    type: count
  }
}
