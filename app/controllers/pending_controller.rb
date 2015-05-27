class PendingController < ApplicationController
  include ApplicationHelper

  def index
    @pending_objs_from_same_section = pending_objs_from_same_section(AcMotor, AnchorLogo, Bearing, BrushHolder, CClip, Capacitor, CarbonBrush, Connector, CordClip, Cord, Grease, Grommet, Nut, PlasticMaterial, Screw, SpiralSpring, Spring, Washer)
    @pending_objs_from_section_head = pending_objs_from_section_head(AcMotor, AnchorLogo, Bearing, BrushHolder, CClip, Capacitor, CarbonBrush, Connector, CordClip, Cord, Grease, Grommet, Nut, PlasticMaterial, Screw, SpiralSpring, Spring, Washer)
    @approved_objs_from_same_section = approved_objs_from_same_section(AcMotor, AnchorLogo, Bearing, BrushHolder, CClip, Capacitor, CarbonBrush, Connector, CordClip, Cord, Grease, Grommet, Nut, PlasticMaterial, Screw, SpiralSpring, Spring, Washer)
    @approved_objs_from_section_head = approved_objs_from_section_head(AcMotor, AnchorLogo, Bearing, BrushHolder, CClip, Capacitor, CarbonBrush, Connector, CordClip, Cord, Grease, Grommet, Nut, PlasticMaterial, Screw, SpiralSpring, Spring, Washer)
    @need_edit_objs = need_edit_objs(AcMotor, AnchorLogo, Bearing, BrushHolder, CClip, Capacitor, CarbonBrush, Connector, CordClip, Cord, Grease, Grommet, Nut, PlasticMaterial, Screw, SpiralSpring, Spring, Washer)
  end
end

