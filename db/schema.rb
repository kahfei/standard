# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150527011815) do

  create_table "ac_motors", force: :cascade do |t|
    t.string   "motor_size"
    t.string   "arm_part_no"
    t.string   "armature_drw"
    t.string   "field_part_no"
    t.string   "field_drw"
    t.string   "voltage"
    t.string   "power"
    t.string   "amps_rating"
    t.string   "output_rpm"
    t.string   "rotation"
    t.string   "no_load_rpm_motor"
    t.string   "gear_ratio"
    t.string   "arm_wire_dia"
    t.string   "field_wire_dia"
    t.string   "winding_type"
    t.string   "arm_resistance"
    t.string   "displace_angle"
    t.string   "arm_no_of_turns"
    t.string   "field_no_of_turns"
    t.string   "field_resistance"
    t.string   "field_wind_drw"
    t.string   "arm_package"
    t.string   "shaft_part_no"
    t.string   "shaft_drw"
    t.string   "arm_stack"
    t.string   "arm_laminate"
    t.string   "field_stack"
    t.string   "field_stack_opt"
    t.string   "arm_end_lami"
    t.string   "molding_comp"
    t.string   "commutator"
    t.string   "arm_copper_wire"
    t.string   "arm_wire_drw"
    t.string   "field_copper_wire"
    t.string   "arm_fan"
    t.string   "insulating_tube"
    t.string   "insulator"
    t.string   "hard_paper_tube"
    t.string   "slot_insulation"
    t.string   "slot_wedge"
    t.string   "pressboard"
    t.string   "field_insulation_paper"
    t.string   "connection_plate"
    t.string   "conn_plate_opt"
    t.string   "end_plate"
    t.string   "end_plate_opt"
    t.string   "polyester_resin"
    t.string   "resin_hardener"
    t.string   "hardener_adhesive"
    t.string   "impregnating_resin"
    t.string   "impreg_hardener"
    t.string   "receptacle_01"
    t.string   "receptacle_02"
    t.string   "field_impregn_resin"
    t.string   "field_resin_hard"
    t.string   "filed_coating"
    t.string   "field_heat_sink"
    t.string   "field_pressboard"
    t.string   "where_used_product"
    t.string   "where_used_plant"
    t.string   "remark"
    t.string   "release_status"
    t.string   "uploaded_by_section"
    t.string   "uploader_role"
    t.string   "uploader_name"
    t.boolean  "need_to_edit_arm_part_no"
    t.boolean  "need_to_edit_motor_size"
    t.boolean  "need_to_edit_armature_drw"
    t.boolean  "need_to_edit_field_part_no"
    t.boolean  "need_to_edit_field_drw"
    t.boolean  "need_to_edit_voltage"
    t.boolean  "need_to_edit_power"
    t.boolean  "need_to_edit_amps_rating"
    t.boolean  "need_to_edit_output_rpm"
    t.boolean  "need_to_edit_rotation"
    t.boolean  "need_to_edit_no_load_rpm_motor"
    t.boolean  "need_to_edit_gear_ratio"
    t.boolean  "need_to_edit_arm_wire_dia"
    t.boolean  "need_to_edit_field_wire_dia"
    t.boolean  "need_to_edit_winding_type"
    t.boolean  "need_to_edit_arm_resistance"
    t.boolean  "need_to_edit_displace_angle"
    t.boolean  "need_to_edit_arm_no_of_turns"
    t.boolean  "need_to_edit_field_no_of_turns"
    t.boolean  "need_to_edit_field_resistance"
    t.boolean  "need_to_edit_field_wind_drw"
    t.boolean  "need_to_edit_arm_package"
    t.boolean  "need_to_edit_shaft_part_no"
    t.boolean  "need_to_edit_shaft_drw"
    t.boolean  "need_to_edit_arm_stack"
    t.boolean  "need_to_edit_arm_laminate"
    t.boolean  "need_to_edit_field_stack"
    t.boolean  "need_to_edit_field_stack_opt"
    t.boolean  "need_to_edit_arm_end_lami"
    t.boolean  "need_to_edit_molding_comp"
    t.boolean  "need_to_edit_commutator"
    t.boolean  "need_to_edit_arm_copper_wire"
    t.boolean  "need_to_edit_arm_wire_drw"
    t.boolean  "need_to_edit_field_copper_wire"
    t.boolean  "need_to_edit_arm_fan"
    t.boolean  "need_to_edit_insulating_tube"
    t.boolean  "need_to_edit_insulator"
    t.boolean  "need_to_edit_hard_paper_tube"
    t.boolean  "need_to_edit_slot_insulation"
    t.boolean  "need_to_edit_slot_wedge"
    t.boolean  "need_to_edit_pressboard"
    t.boolean  "need_to_edit_field_insulation_paper"
    t.boolean  "need_to_edit_connection_plate"
    t.boolean  "need_to_edit_conn_plate_opt"
    t.boolean  "need_to_edit_end_plate"
    t.boolean  "need_to_edit_end_plate_opt"
    t.boolean  "need_to_edit_polyester_resin"
    t.boolean  "need_to_edit_resin_hardener"
    t.boolean  "need_to_edit_hardener_adhesive"
    t.boolean  "need_to_edit_impregnating_resin"
    t.boolean  "need_to_edit_impreg_hardener"
    t.boolean  "need_to_edit_receptacle_01"
    t.boolean  "need_to_edit_receptacle_02"
    t.boolean  "need_to_edit_field_impregn_resin"
    t.boolean  "need_to_edit_field_resin_hard"
    t.boolean  "need_to_edit_filed_coating"
    t.boolean  "need_to_edit_field_heat_sink"
    t.boolean  "need_to_edit_field_pressboard"
    t.boolean  "need_to_edit_where_used_product"
    t.boolean  "need_to_edit_where_used_plant"
    t.boolean  "need_to_edit_remark"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "reason"
  end

  create_table "anchor_logos", force: :cascade do |t|
    t.string   "housing_partnumber",                 limit: 255
    t.string   "housing_supplier",                   limit: 255
    t.decimal  "anchor_logo_diameter"
    t.string   "partnumber",                         limit: 255
    t.string   "anchor_logo_supplier",               limit: 255
    t.string   "bosch_logo_partnumber",              limit: 255
    t.string   "bosch_logo_supplier",                limit: 255
    t.string   "where_used_product",                 limit: 255
    t.string   "where_used_plant",                   limit: 255
    t.string   "remark",                             limit: 255
    t.string   "reason",                             limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "release_status",                     limit: 255
    t.string   "uploaded_by_section",                limit: 255
    t.string   "uploader_role",                      limit: 255
    t.string   "uploader_name",                      limit: 255
    t.boolean  "need_to_edit_housing_partnumber"
    t.boolean  "need_to_edit_housing_supplier"
    t.boolean  "need_to_edit_anchor_logo_diameter"
    t.boolean  "need_to_edit_partnumber"
    t.boolean  "need_to_edit_anchor_logo_supplier"
    t.boolean  "need_to_edit_bosch_logo_partnumber"
    t.boolean  "need_to_edit_bosch_logo_supplier"
    t.boolean  "need_to_edit_where_used_product"
    t.boolean  "need_to_edit_where_used_plant"
    t.boolean  "need_to_edit_remark"
    t.boolean  "need_to_edit_reason"
  end

  create_table "bearing_imports", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bearings", force: :cascade do |t|
    t.string   "partnumber",                           limit: 255
    t.string   "description",                          limit: 255
    t.float    "i_dia"
    t.float    "o_dia"
    t.float    "width"
    t.string   "bearing_type",                         limit: 255
    t.string   "bearing_no",                           limit: 255
    t.string   "radial_clearance_um",                  limit: 255
    t.string   "sealing",                              limit: 255
    t.integer  "max_speed_rpm"
    t.string   "position_within_product",              limit: 255
    t.string   "drawing_norm",                         limit: 255
    t.string   "where_used_product",                   limit: 255
    t.string   "where_used_plant",                     limit: 255
    t.string   "supplier",                             limit: 255
    t.string   "remark",                               limit: 255
    t.string   "release_status",                       limit: 255
    t.string   "uploaded_by_section",                  limit: 255
    t.string   "uploader_role",                        limit: 255
    t.string   "uploader_name",                        limit: 255
    t.boolean  "need_to_edit_partnumber"
    t.boolean  "need_to_edit_description"
    t.boolean  "need_to_edit_i_dia"
    t.boolean  "need_to_edit_o_dia"
    t.boolean  "need_to_edit_width"
    t.boolean  "need_to_edit_bearing_type"
    t.boolean  "need_to_edit_bearing_no"
    t.boolean  "need_to_edit_radial_clearance_um"
    t.boolean  "need_to_edit_sealing"
    t.boolean  "need_to_edit_max_speed_rpm"
    t.boolean  "need_to_edit_position_within_product"
    t.boolean  "need_to_edit_drawing_norm"
    t.boolean  "need_to_edit_where_used_product"
    t.boolean  "need_to_edit_where_used_plant"
    t.boolean  "need_to_edit_supplier"
    t.boolean  "need_to_edit_remark"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "reason",                               limit: 255
    t.boolean  "need_to_edit_reason"
  end

  create_table "brush_holder_imports", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "brush_holders", force: :cascade do |t|
    t.string   "partnumber",                              limit: 255
    t.string   "description",                             limit: 255
    t.string   "brush_holder_type",                       limit: 255
    t.string   "material",                                limit: 255
    t.string   "drawing_norm",                            limit: 255
    t.string   "corresponding_carbon_brush",              limit: 255
    t.string   "supplier",                                limit: 255
    t.string   "where_used_product",                      limit: 255
    t.string   "where_used_plant",                        limit: 255
    t.string   "release_status",                          limit: 255
    t.string   "uploaded_by_section",                     limit: 255
    t.string   "uploader_role",                           limit: 255
    t.string   "uploader_name",                           limit: 255
    t.boolean  "need_to_edit_partnumber"
    t.boolean  "need_to_edit_description"
    t.boolean  "need_to_edit_brush_holder_type"
    t.boolean  "need_to_edit_material"
    t.boolean  "need_to_edit_drawing_norm"
    t.boolean  "need_to_edit_corresponding_carbon_brush"
    t.boolean  "need_to_edit_supplier"
    t.boolean  "need_to_edit_where_used_product"
    t.boolean  "need_to_edit_where_used_plant"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "reason",                                  limit: 255
    t.boolean  "need_to_edit_reason"
  end

  create_table "c_clip_imports", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "c_clips", force: :cascade do |t|
    t.string   "partnumber",                      limit: 255
    t.string   "description",                     limit: 255
    t.string   "clip_type",                       limit: 255
    t.float    "norminal_diameter"
    t.float    "thickness"
    t.string   "coating",                         limit: 255
    t.string   "drawing_norm",                    limit: 255
    t.string   "where_used_product",              limit: 255
    t.string   "where_used_plant",                limit: 255
    t.string   "remark",                          limit: 255
    t.string   "release_status",                  limit: 255
    t.string   "uploaded_by_section",             limit: 255
    t.string   "uploader_role",                   limit: 255
    t.string   "uploader_name",                   limit: 255
    t.boolean  "need_to_edit_partnumber"
    t.boolean  "need_to_edit_description"
    t.boolean  "need_to_edit_clip_type"
    t.boolean  "need_to_edit_norminal_diameter"
    t.boolean  "need_to_edit_thickness"
    t.boolean  "need_to_edit_coating"
    t.boolean  "need_to_edit_drawing_norm"
    t.boolean  "need_to_edit_where_used_product"
    t.boolean  "need_to_edit_where_used_plant"
    t.boolean  "need_to_edit_remark"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "reason",                          limit: 255
    t.boolean  "need_to_edit_reason"
  end

  create_table "capacitor_imports", force: :cascade do |t|
    t.string   "new",        limit: 255
    t.string   "create",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "capacitors", force: :cascade do |t|
    t.string   "partnumber",                      limit: 255
    t.string   "description",                     limit: 255
    t.string   "capacitor_type",                  limit: 255
    t.string   "capacity",                        limit: 255
    t.string   "feet",                            limit: 255
    t.string   "capacitor_class",                 limit: 255
    t.string   "drawing_norm",                    limit: 255
    t.string   "where_used_product",              limit: 255
    t.string   "where_used_plant",                limit: 255
    t.string   "remark",                          limit: 255
    t.string   "release_status",                  limit: 255
    t.string   "uploaded_by_section",             limit: 255
    t.string   "uploader_role",                   limit: 255
    t.string   "uploader_name",                   limit: 255
    t.boolean  "need_to_edit_partnumber"
    t.boolean  "need_to_edit_description"
    t.boolean  "need_to_edit_capacitor_type"
    t.boolean  "need_to_edit_capacity"
    t.boolean  "need_to_edit_feet"
    t.boolean  "need_to_edit_capacitor_class"
    t.boolean  "need_to_edit_drawing_norm"
    t.boolean  "need_to_edit_where_used_product"
    t.boolean  "need_to_edit_where_used_plant"
    t.boolean  "need_to_edit_remark"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "reason",                          limit: 255
    t.boolean  "need_to_edit_reason"
  end

  create_table "carbon_brush_imports", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "carbon_brushes", force: :cascade do |t|
    t.string   "partnumber",                                     limit: 255
    t.string   "description",                                    limit: 255
    t.string   "components",                                     limit: 255
    t.string   "cross_sec",                                      limit: 255
    t.float    "length"
    t.float    "wire_length_or_spring_free_length"
    t.float    "radius_for_commutator_mm"
    t.string   "cut_off",                                        limit: 255
    t.string   "supplier",                                       limit: 255
    t.string   "drawing_norm",                                   limit: 255
    t.string   "where_used_product",                             limit: 255
    t.string   "where_used_plant",                               limit: 255
    t.string   "remark",                                         limit: 255
    t.string   "release_status",                                 limit: 255
    t.string   "uploaded_by_section",                            limit: 255
    t.string   "uploader_role",                                  limit: 255
    t.string   "uploader_name",                                  limit: 255
    t.boolean  "need_to_edit_partnumber"
    t.boolean  "need_to_edit_description"
    t.boolean  "need_to_edit_components"
    t.boolean  "need_to_edit_cross_sec"
    t.boolean  "need_to_edit_length"
    t.boolean  "need_to_edit_wire_length_or_spring_free_length"
    t.boolean  "need_to_edit_radius_for_commutator_mm"
    t.boolean  "need_to_edit_cut_off"
    t.boolean  "need_to_edit_supplier"
    t.boolean  "need_to_edit_drawing_norm"
    t.boolean  "need_to_edit_where_used_product"
    t.boolean  "need_to_edit_where_used_plant"
    t.boolean  "need_to_edit_remark"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "reason",                                         limit: 255
    t.boolean  "need_to_edit_reason"
  end

  create_table "connector_imports", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "connectors", force: :cascade do |t|
    t.string   "partnumber",                      limit: 255
    t.string   "description",                     limit: 255
    t.string   "connector_type",                  limit: 255
    t.string   "drawing_norm",                    limit: 255
    t.string   "h_x_w",                           limit: 255
    t.string   "supplier",                        limit: 255
    t.string   "where_used_product",              limit: 255
    t.string   "release_status",                  limit: 255
    t.string   "uploaded_by_section",             limit: 255
    t.string   "uploader_role",                   limit: 255
    t.string   "uploader_name",                   limit: 255
    t.boolean  "need_to_edit_partnumber"
    t.boolean  "need_to_edit_description"
    t.boolean  "need_to_edit_connector_type"
    t.boolean  "need_to_edit_drawing_norm"
    t.boolean  "need_to_edit_h_x_w"
    t.boolean  "need_to_edit_supplier"
    t.boolean  "need_to_edit_where_used_product"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "reason",                          limit: 255
    t.string   "where_used_plant",                limit: 255
    t.boolean  "need_to_edit_where_used_plant"
    t.boolean  "need_to_edit_reason"
  end

  create_table "copperwire_imports", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "copperwires", force: :cascade do |t|
    t.string   "partnumber",                      limit: 255
    t.string   "description",                     limit: 255
    t.string   "copperwire_type",                 limit: 255
    t.string   "self_bonded",                     limit: 255
    t.float    "diameter"
    t.string   "drawing_norm",                    limit: 255
    t.string   "supplier",                        limit: 255
    t.string   "where_used_product",              limit: 255
    t.string   "release_status",                  limit: 255
    t.string   "uploaded_by_section",             limit: 255
    t.string   "uploader_role",                   limit: 255
    t.string   "uploader_name",                   limit: 255
    t.boolean  "need_to_edit_partnumber"
    t.boolean  "need_to_edit_description"
    t.boolean  "need_to_edit_copperwire_type"
    t.boolean  "need_to_edit_self_bonded"
    t.boolean  "need_to_edit_diameter"
    t.boolean  "need_to_edit_drawing_norm"
    t.boolean  "need_to_edit_supplier"
    t.boolean  "need_to_edit_where_used_product"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "reason",                          limit: 255
    t.boolean  "need_to_edit_where_used_plant"
    t.string   "where_used_plant",                limit: 255
    t.boolean  "need_to_edit_reason"
  end

  create_table "cord_clip_imports", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cord_clips", force: :cascade do |t|
    t.string   "partnumber",                      limit: 255
    t.string   "description",                     limit: 255
    t.string   "cord_clip_type",                  limit: 255
    t.string   "material",                        limit: 255
    t.float    "max_cord_od"
    t.string   "drawing_norm",                    limit: 255
    t.string   "where_used_product",              limit: 255
    t.string   "where_used_plant",                limit: 255
    t.string   "remark",                          limit: 255
    t.string   "release_status",                  limit: 255
    t.string   "uploaded_by_section",             limit: 255
    t.string   "uploader_role",                   limit: 255
    t.string   "uploader_name",                   limit: 255
    t.boolean  "need_to_edit_partnumber"
    t.boolean  "need_to_edit_description"
    t.boolean  "need_to_edit_cord_clip_type"
    t.boolean  "need_to_edit_material"
    t.boolean  "need_to_edit_max_cord_od"
    t.boolean  "need_to_edit_drawing_norm"
    t.boolean  "need_to_edit_where_used_product"
    t.boolean  "need_to_edit_where_used_plant"
    t.boolean  "need_to_edit_remark"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "reason",                          limit: 255
    t.boolean  "need_to_edit_reason"
  end

  create_table "cord_imports", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cords", force: :cascade do |t|
    t.string   "partnumber",                      limit: 255
    t.string   "description",                     limit: 255
    t.string   "cord_mat",                        limit: 255
    t.string   "cord_type",                       limit: 255
    t.string   "plug_type",                       limit: 255
    t.string   "polarity",                        limit: 255
    t.string   "cross_sec",                       limit: 255
    t.string   "cord_od",                         limit: 255
    t.string   "length",                          limit: 255
    t.string   "dismantled_length",               limit: 255
    t.string   "switch_con",                      limit: 255
    t.string   "drawing_norm",                    limit: 255
    t.string   "where_used_product",              limit: 255
    t.string   "where_used_plant",                limit: 255
    t.string   "cord_spec",                       limit: 255
    t.string   "remark",                          limit: 255
    t.string   "release_status",                  limit: 255
    t.string   "uploaded_by_section",             limit: 255
    t.string   "uploader_role",                   limit: 255
    t.string   "uploader_name",                   limit: 255
    t.boolean  "need_to_edit_partnumber"
    t.boolean  "need_to_edit_description"
    t.boolean  "need_to_edit_cord_mat"
    t.boolean  "need_to_edit_cord_type"
    t.boolean  "need_to_edit_plug_type"
    t.boolean  "need_to_edit_polarity"
    t.boolean  "need_to_edit_cross_sec"
    t.boolean  "need_to_edit_cord_od"
    t.boolean  "need_to_edit_length"
    t.boolean  "need_to_edit_dismantled_length"
    t.boolean  "need_to_edit_switch_con"
    t.boolean  "need_to_edit_drawing_norm"
    t.boolean  "need_to_edit_where_used_product"
    t.boolean  "need_to_edit_where_used_plant"
    t.boolean  "need_to_edit_cord_spec"
    t.boolean  "need_to_edit_remark"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "reason",                          limit: 255
    t.boolean  "need_to_edit_reason"
  end

  create_table "greases", force: :cascade do |t|
    t.string   "partnumber",                       limit: 255
    t.string   "description",                      limit: 255
    t.string   "grease_type",                      limit: 255
    t.string   "lubricated_location",              limit: 255
    t.string   "drawing_norm",                     limit: 255
    t.string   "supplier",                         limit: 255
    t.string   "where_used_product",               limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "release_status",                   limit: 255
    t.string   "uploaded_by_section",              limit: 255
    t.string   "uploader_role",                    limit: 255
    t.string   "uploader_name",                    limit: 255
    t.boolean  "need_to_edit_partnumber"
    t.boolean  "need_to_edit_description"
    t.boolean  "need_to_edit_grease_type"
    t.boolean  "need_to_edit_lubricated_location"
    t.boolean  "need_to_edit_drawing_norm"
    t.boolean  "need_to_edit_supplier"
    t.boolean  "need_to_edit_where_used_product"
    t.string   "reason",                           limit: 255
    t.boolean  "need_to_edit_where_used_plant"
    t.string   "where_used_plant",                 limit: 255
    t.boolean  "need_to_edit_reason"
  end

  create_table "grommet_imports", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "grommets", force: :cascade do |t|
    t.string   "partnumber",                       limit: 255
    t.string   "description",                      limit: 255
    t.string   "inner_hole_diameter",              limit: 255
    t.string   "grommet_type",                     limit: 255
    t.string   "length",                           limit: 255
    t.string   "for_cord_od",                      limit: 255
    t.string   "material",                         limit: 255
    t.string   "drawing_norm",                     limit: 255
    t.string   "where_used_product",               limit: 255
    t.string   "where_used_plant",                 limit: 255
    t.string   "remark",                           limit: 255
    t.string   "release_status",                   limit: 255
    t.string   "uploaded_by_section",              limit: 255
    t.string   "uploader_role",                    limit: 255
    t.string   "uploader_name",                    limit: 255
    t.boolean  "need_to_edit_partnumber"
    t.boolean  "need_to_edit_description"
    t.boolean  "need_to_edit_inner_hole_diameter"
    t.boolean  "need_to_edit_grommet_type"
    t.boolean  "need_to_edit_length"
    t.boolean  "need_to_edit_for_cord_od"
    t.boolean  "need_to_edit_material"
    t.boolean  "need_to_edit_drawing_norm"
    t.boolean  "need_to_edit_where_used_product"
    t.boolean  "need_to_edit_where_used_plant"
    t.boolean  "need_to_edit_remark"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "reason",                           limit: 255
    t.boolean  "need_to_edit_reason"
  end

  create_table "nut_imports", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nuts", force: :cascade do |t|
    t.string   "partnumber",                      limit: 255
    t.string   "description",                     limit: 255
    t.string   "nut_type",                        limit: 255
    t.string   "nut_size",                        limit: 255
    t.decimal  "width"
    t.string   "drawing_number",                  limit: 255
    t.string   "coating",                         limit: 255
    t.string   "where_used_product",              limit: 255
    t.string   "where_used_plant",                limit: 255
    t.string   "remark",                          limit: 255
    t.string   "release_status",                  limit: 255
    t.string   "uploaded_by_section",             limit: 255
    t.string   "uploader_role",                   limit: 255
    t.string   "uploader_name",                   limit: 255
    t.boolean  "need_to_edit_partnumber"
    t.boolean  "need_to_edit_description"
    t.boolean  "need_to_edit_nut_type"
    t.boolean  "need_to_edit_nut_size"
    t.boolean  "need_to_edit_width"
    t.boolean  "need_to_edit_drawing_number"
    t.boolean  "need_to_edit_coating"
    t.boolean  "need_to_edit_where_used_product"
    t.boolean  "need_to_edit_where_used_plant"
    t.boolean  "need_to_edit_remark"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "reason",                          limit: 255
    t.boolean  "need_to_edit_reason"
    t.string   "material"
    t.boolean  "need_to_edit_material"
  end

  create_table "plastic_material_imports", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plastic_materials", force: :cascade do |t|
    t.string   "partnumber",                          limit: 255
    t.string   "resin",                               limit: 255
    t.string   "color",                               limit: 255
    t.string   "supplier",                            limit: 255
    t.string   "recommendation",                      limit: 255
    t.string   "ul_number",                           limit: 255
    t.string   "drawing_norm",                        limit: 255
    t.string   "where_used_product",                  limit: 255
    t.string   "supplier_material_info",              limit: 255
    t.string   "related_molders",                     limit: 255
    t.string   "release_status",                      limit: 255
    t.string   "uploaded_by_section",                 limit: 255
    t.string   "uploader_role",                       limit: 255
    t.string   "uploader_name",                       limit: 255
    t.boolean  "need_to_edit_partnumber"
    t.boolean  "need_to_edit_resin"
    t.boolean  "need_to_edit_color"
    t.boolean  "need_to_edit_supplier"
    t.boolean  "need_to_edit_recommendation"
    t.boolean  "need_to_edit_ul_number"
    t.boolean  "need_to_edit_drawing_norm"
    t.boolean  "need_to_edit_where_used_product"
    t.boolean  "need_to_edit_supplier_material_info"
    t.boolean  "need_to_edit_related_molders"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "reason",                              limit: 255
    t.boolean  "need_to_edit_where_used_plant"
    t.string   "where_used_plant",                    limit: 255
    t.boolean  "need_to_edit_reason"
  end

  create_table "screw_imports", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "screws", force: :cascade do |t|
    t.string   "partnumber",                       limit: 255
    t.string   "description",                      limit: 255
    t.string   "screw_drive",                      limit: 255
    t.string   "screw_head",                       limit: 255
    t.string   "thread_type",                      limit: 255
    t.string   "screw_size",                       limit: 255
    t.float    "length"
    t.string   "connection_material",              limit: 255
    t.string   "coating",                          limit: 255
    t.string   "drawing_norm",                     limit: 255
    t.string   "where_used_product",               limit: 255
    t.string   "where_used_plant",                 limit: 255
    t.string   "remark",                           limit: 255
    t.string   "release_status",                   limit: 255
    t.string   "uploaded_by_section",              limit: 255
    t.string   "uploader_role",                    limit: 255
    t.string   "uploader_name",                    limit: 255
    t.boolean  "need_to_edit_partnumber"
    t.boolean  "need_to_edit_description"
    t.boolean  "need_to_edit_screw_drive"
    t.boolean  "need_to_edit_screw_head"
    t.boolean  "need_to_edit_thread_type"
    t.boolean  "need_to_edit_screw_size"
    t.boolean  "need_to_edit_length"
    t.boolean  "need_to_edit_connection_material"
    t.boolean  "need_to_edit_coating"
    t.boolean  "need_to_edit_drawing_norm"
    t.boolean  "need_to_edit_where_used_product"
    t.boolean  "need_to_edit_where_used_plant"
    t.boolean  "need_to_edit_remark"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "reason",                           limit: 255
    t.boolean  "need_to_edit_reason"
  end

  create_table "spiral_spring_imports", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spiral_springs", force: :cascade do |t|
    t.string   "partnumber",                                limit: 255
    t.string   "description",                               limit: 255
    t.float    "material_thickness"
    t.float    "material_width"
    t.float    "outer_dia"
    t.float    "torsion_arm_length"
    t.float    "torsion_arm_movable_distance"
    t.float    "initial_force"
    t.float    "final_force"
    t.string   "supplier",                                  limit: 255
    t.string   "drawing_norm",                              limit: 255
    t.string   "where_used_product",                        limit: 255
    t.string   "where_used_plant",                          limit: 255
    t.string   "release_status",                            limit: 255
    t.string   "uploaded_by_section",                       limit: 255
    t.string   "uploader_role",                             limit: 255
    t.string   "uploader_name",                             limit: 255
    t.boolean  "need_to_edit_partnumber"
    t.boolean  "need_to_edit_description"
    t.boolean  "need_to_edit_material_thickness"
    t.boolean  "need_to_edit_material_width"
    t.boolean  "need_to_edit_outer_dia"
    t.boolean  "need_to_edit_torsion_arm_length"
    t.boolean  "need_to_edit_torsion_arm_movable_distance"
    t.boolean  "need_to_edit_initial_force"
    t.boolean  "need_to_edit_final_force"
    t.boolean  "need_to_edit_supplier"
    t.boolean  "need_to_edit_drawing_norm"
    t.boolean  "need_to_edit_where_used_product"
    t.boolean  "need_to_edit_where_used_plant"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "reason",                                    limit: 255
    t.boolean  "need_to_edit_reason"
  end

  create_table "spring_imports", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "springs", force: :cascade do |t|
    t.string   "partnumber",                      limit: 255
    t.string   "description",                     limit: 255
    t.string   "spring_type",                     limit: 255
    t.float    "material_dia"
    t.float    "mean_dia"
    t.float    "free_length"
    t.float    "no_of_active_coils"
    t.float    "solid_length_max"
    t.float    "dimension_f1"
    t.float    "dimension_l1"
    t.float    "dimension_f2"
    t.float    "dimension_l2"
    t.float    "initial_load_nm"
    t.float    "final_load_nm"
    t.float    "torque_arm_length"
    t.float    "hook_length"
    t.float    "hook_arc_radius"
    t.float    "spring_constant"
    t.string   "unit",                            limit: 255
    t.string   "supplier",                        limit: 255
    t.string   "drawing_norm",                    limit: 255
    t.string   "where_used_product",              limit: 255
    t.string   "where_used_plant",                limit: 255
    t.string   "remark",                          limit: 255
    t.string   "release_status",                  limit: 255
    t.string   "uploaded_by_section",             limit: 255
    t.string   "uploader_role",                   limit: 255
    t.string   "uploader_name",                   limit: 255
    t.boolean  "need_to_edit_partnumber"
    t.boolean  "need_to_edit_description"
    t.boolean  "need_to_edit_spring_type"
    t.boolean  "need_to_edit_material_dia"
    t.boolean  "need_to_edit_mean_dia"
    t.boolean  "need_to_edit_free_length"
    t.boolean  "need_to_edit_no_of_active_coils"
    t.boolean  "need_to_edit_solid_length_max"
    t.boolean  "need_to_edit_dimension_f1"
    t.boolean  "need_to_edit_dimension_l1"
    t.boolean  "need_to_edit_dimension_f2"
    t.boolean  "need_to_edit_dimension_l2"
    t.boolean  "need_to_edit_initial_load_nm"
    t.boolean  "need_to_edit_final_load_nm"
    t.boolean  "need_to_edit_torque_arm_length"
    t.boolean  "need_to_edit_hook_length"
    t.boolean  "need_to_edit_hook_arc_radius"
    t.boolean  "need_to_edit_spring_constant"
    t.boolean  "need_to_edit_unit"
    t.boolean  "need_to_edit_supplier"
    t.boolean  "need_to_edit_drawing_norm"
    t.boolean  "need_to_edit_where_used_product"
    t.boolean  "need_to_edit_where_used_plant"
    t.boolean  "need_to_edit_remark"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "reason",                          limit: 255
    t.boolean  "need_to_edit_reason"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "hashed_password", limit: 255
    t.string   "salt",            limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "fullname",        limit: 255
    t.string   "department",      limit: 255
    t.string   "email",           limit: 255
    t.string   "phone",           limit: 255
    t.string   "location",        limit: 255
    t.string   "role",            limit: 255
    t.string   "section",         limit: 255
  end

  create_table "washer_imports", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "washers", force: :cascade do |t|
    t.string   "partnumber",                      limit: 255
    t.string   "description",                     limit: 255
    t.string   "washer_type",                     limit: 255
    t.float    "inner_diameter"
    t.float    "outer_diameter"
    t.float    "thickness"
    t.string   "coating",                         limit: 255
    t.string   "material",                        limit: 255
    t.string   "drawing_number",                  limit: 255
    t.string   "where_used_product",              limit: 255
    t.string   "where_used_plant",                limit: 255
    t.string   "remark",                          limit: 255
    t.string   "release_status",                  limit: 255
    t.string   "uploaded_by_section",             limit: 255
    t.string   "uploader_role",                   limit: 255
    t.string   "uploader_name",                   limit: 255
    t.boolean  "need_to_edit_partnumber"
    t.boolean  "need_to_edit_description"
    t.boolean  "need_to_edit_washer_type"
    t.boolean  "need_to_edit_inner_diameter"
    t.boolean  "need_to_edit_outer_diameter"
    t.boolean  "need_to_edit_thickness"
    t.boolean  "need_to_edit_coating"
    t.boolean  "need_to_edit_material"
    t.boolean  "need_to_edit_drawing_number"
    t.boolean  "need_to_edit_where_used_product"
    t.boolean  "need_to_edit_where_used_plant"
    t.boolean  "need_to_edit_remark"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "reason",                          limit: 255
    t.boolean  "need_to_edit_reason"
    t.string   "hardness"
    t.string   "original_plant"
    t.boolean  "need_to_edit_hardness"
    t.boolean  "need_to_edit_original_plant"
  end

end
