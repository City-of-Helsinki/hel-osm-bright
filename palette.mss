/* ****************************************************************** */
/* SERVICE MAP based on OSM BRIGHT for Postgres                         */
/* ****************************************************************** */

/* Heavily edited by Kalle Järvenpää
 */


/* For basic style customization you can simply edit the colors and
 * fonts defined in this file. For more detailed / advanced
 * adjustments explore the other files.
 *
 * GENERAL NOTES
 *
 * There is a slight performance cost in rendering line-caps.  An
 * effort has been made to restrict line-cap definitions to styles
 * where the results will be visible (lines at least 2 pixels thick).
 */

/* ================================================================== */
/* FONTS
/* ================================================================== */

/* directory to load fonts from in addition to the system directories */
Map { font-directory: url(./fonts); }

/* set up font sets for various weights and styles */
@sans_lt:           "Lato Light";
@sans_lt_italic:    "Lato Light Italic";
@sans:              "Lato Regular";
@sans_italic:       "Lato Italic";
@sans_bold:         "Lato Bold";
@sans_bold_italic:  "Lato Bold Italic";

/* Some fonts are larger or smaller than others. Use this variable to
   globally increase or decrease the font sizes. */
/* Note this is only implemented for certain things so far */
@text_adjust: 1;

/* ================================================================== */
/* LANDUSE & LANDCOVER COLORS
/* ================================================================== */

@land:              #fcf7f5; // #FCFBE7;
@water:             #77d5ed; // #8ebece; // #77d5ed; // #C4DFF6;
@grass:             #c6e8b4; // #E6F2C1;
@beach:             #e0f2b6; // #dcf1aa; // or @land #FFEEC7;
@park:              @grass;  // #DAF2C1;
@cemetery:          @park;   // #D6DED2;
@wooded:            @park;   // darken(@park, 5%); // #C3D9AD;
@agriculture:       @beach;  // #F2E8B6;

@building:          #e8e5df; // #E4E0E0;
@landuse_basic:     desaturate( darken( @land, 5% ), 20% ); // lighten( @building, 10% );

@hospital:          @landuse_basic; // rgb(229,198,195);
@school:            @landuse_basic; // #FFF5CC;
@sports:            @grass; // #B8E6B8;

@residential:       @landuse_basic; // @land * 0.98;
@commercial:        @landuse_basic; // @land * 0.97;
@industrial:        @landuse_basic; // @land * 0.96;

@pedestrian_area:   #fff;

@parking:           @landuse_basic; // This should be same as @standard_fill

// Use for the coastline shadow effect
@coastline-shadow:  @water;
@coastline-shadow-step-fade: 0.0055;
@coastline-shadow-step-width: 4;

/* ================================================================== */
/* GENERAL USE
/* ================================================================== */

@standard_fill:     #fff;
@standard_line:     #999;
@standard_line_light: #bbb;
@standard_case:     #999;

@standard_line_width: 0.25;

/* ================================================================== */
/* ROAD COLORS
/* ================================================================== */

/* For each class of road there are three color variables:
 * - line: for lower zoomlevels when the road is represented by a
 *         single solid line.
 * - case: for higher zoomlevels, this color is for the road's
 *         casing (outline).
 * - fill: for higher zoomlevels, this color is for the road's
 *         inner fill (inline).
 */

@motorway_fill:     #fffac4;
@motorway_line:     darken(@motorway_fill,20%);
@motorway_case:     darken(@motorway_fill,50%);

@trunk_fill:        @motorway_fill;
@trunk_line:        @motorway_line;
@trunk_case:        @motorway_case;

@primary_fill:      @standard_fill;
@primary_line:      @standard_line_light;
@primary_case:      @standard_case;

@secondary_fill:    @standard_fill;
@secondary_line:    @standard_line_light;
@secondary_case:    @standard_case;

@pedestrian_fill:   @landuse_basic;
@pedestrian_line:   @standard_line;
@pedestrian_case:   @standard_line_light;

@cycle_fill:        @landuse_basic;
@cycle_line:        @standard_line;
@cycle_case:        @standard_line_light;

@rail_fill:         #fff;
@rail_line:         @standard_line;
@rail_case:         @land;

@subway_line:       #fd902f;
@tram_line:         #0fda49;


@aeroway:           @standard_line_light;

/* ================================================================== */
/* BOUNDARY COLORS
/* ================================================================== */

@admin_2:           #324; // XXX

/* ================================================================== */
/* LABEL COLORS
/* ================================================================== */

/* We set up a default halo color for places so you can edit them all
   at once or override each individually. */
@place_halo:        #fff;
@text_color_basic:  #444;

@country_text:      @text_color_basic;
@country_halo:      @place_halo;

@state_text:        @text_color_basic;
@state_halo:        @place_halo;

@city_text:         @text_color_basic;
@city_halo:         @place_halo;

@town_text:         @text_color_basic;
@town_halo:         @place_halo;

@poi_text:          @text_color_basic;

@road_text:         @text_color_basic;
@road_halo:         @standard_fill;

@other_text:        @text_color_basic;
@other_halo:        @place_halo;

@locality_text:     @text_color_basic;
@locality_halo:     @land;

/* Also used for other small places: hamlets, suburbs, localities */
@village_text:      @text_color_basic;
@village_halo:      @place_halo;

/* ================================================================== */
/* FADE OPACITIES
/* ================================================================== */

/* These are used when fading in some features */

@fade_in_opacity_1: 0.2;
@fade_in_opacity_2: 0.5;
@fade_in_opacity_3: 0.9;

/* ****************************************************************** */