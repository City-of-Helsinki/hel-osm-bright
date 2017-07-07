/* BASE.MSS CONTENTS
 * - Landuse & landcover
 * - Water areas
 * - Water ways
 * - Administrative Boundaries
 *
 */

/* ================================================================== */
/* LANDUSE & LANDCOVER
/* ================================================================== */

#land[zoom>=0][zoom<11],
#shoreline_300[zoom>=7][zoom<11],
#processed_p[zoom>=11] {
  polygon-fill: @land;
  polygon-gamma: 0.75;
  [zoom>=16] {
    building-fill:@land;
    building-height: 2;
  }
}

// Only start showing landuse at zoom levels of 10 or greater
// #landuse_gen0[zoom>4][zoom<=10],
#landuse_gen1[zoom>10][zoom<=13],
#landuse[zoom>13] {  
  // We need rather unelegantly to enter each type twice so as to
  // not show all landuses as black, when using the catch-all
  // selectors for zoom levels 10 and 11. First, we declare
  // the colours for each type, and thereafter list each thus
  // declared type again in a long selector for the fade-in style.
  
  // Colours
  [type='allotments']    { polygon-fill: @park; }
  [type='cemetery']      { polygon-fill: @cemetery; }
  [type='farm'],[type='farmland'],[type='farmyard']
                         { polygon-fill: @agriculture; }
  [type='forest']        { polygon-fill: @wooded; }
  [type='garden']        { polygon-fill: @park; }
  [type='golf_course']   { polygon-fill: @sports; }
  [type='grass']         { polygon-fill: @grass; }
  [type='meadow']        { polygon-fill: @park; }
  [type='park']          { polygon-fill: @park; }
  [type='parking']       { polygon-fill: @parking; }
  [type='pedestrian'],[type='steps']
                         { polygon-fill: @pedestrian_fill;
                           line-color:   @pedestrian_case;
                           line-join:    round;
                           line-width:   @standard_line_width; }
  [type='pitch']         { polygon-fill: @sports; }
  [type='playground']    { polygon-fill: @park; }
  [type='recreation_ground']
                         { polygon-fill: @park; }
  [type='scrub']         { polygon-fill: @park; }
  [type='sports_centre'] { polygon-fill: @sports; }
  [type='stadium']       { polygon-fill: @sports; }
  [type='village_green'] { polygon-fill: @grass; }
  [type='wood']          { polygon-fill: @wooded; }
  
  // Fade in
  [type='allotments'],[type='cemetery'],[type='farm'],
    [type='farmland'],[type='farmyard'],[type='forest'],
    [type='garden'],[type='golf_course'],[type='grass'],
    [type='meadow'],[type='park'],[type='pedestrian'],
    [type='pitch'],[type='playground'],[type='recreation_ground'],
    [type='scrub'],[type='sports_centre'],[type='stadium'],
    [type='village_green'],[type='wood'] {
      [zoom=11]              { polygon-opacity: @fade_in_opacity_1; }
      [zoom=12]              { polygon-opacity: @fade_in_opacity_2; }
  }


  /* Colours for all landuses. Now we show only greenery.
  
    // Colours
    [type='allotments']    { polygon-fill: @park; }
    [type='cemetery']      { polygon-fill: @cemetery; }
    [type='cinema']        { polygon-fill: @commercial; }
    [type='college']       { polygon-fill: @school; }
    [type='commercial']    { polygon-fill: @industrial; }
    [type='common']        { polygon-fill: @park; }
    [type='farm'],[type='farmland'],[type='farmyard']
                           { polygon-fill: @agriculture; }
    [type='forest']        { polygon-fill: @wooded; }
    [type='fuel']          { polygon-fill: @commercial; }
    [type='garden']        { polygon-fill: @park; }
    [type='golf_course']   { polygon-fill: @sports; }
    [type='grass']         { polygon-fill: @grass; }
    [type='hospital']      { polygon-fill: @hospital; }
    [type='industrial']    { polygon-fill: @industrial; }
    [type='library']       { polygon-fill: @commercial; }
    [type='meadow']        { polygon-fill: @park; }
    [type='park']          { polygon-fill: @park; }
    [type='parking']       { polygon-fill: @parking; }
    [type='pedestrian']    { polygon-fill: @pedestrian_area; }
    [type='pitch']         { polygon-fill: @sports; }
    [type='place_of_worship']
                           { polygon-fill: @commercial; }
    [type='playground']    { polygon-fill: @park; }
    [type='quarry']        { polygon-fill: @industrial; }
    [type='railway']       { polygon-fill: @industrial; }
    [type='recreation_ground']
                           { polygon-fill: @park; }
    [type='residential']   { polygon-fill: @residential; }
    [type='retail']        { polygon-fill: @commercial; }
    [type='school']        { polygon-fill: @school; }
    [type='scrub']         { polygon-fill: @park; }
    [type='sports_centre'] { polygon-fill: @sports; }
    [type='stadium']       { polygon-fill: @sports; }
    [type='theatre']       { polygon-fill: @commercial; }
    [type='university']    { polygon-fill: @school; }
    [type='village_green'] { polygon-fill: @grass; }
    [type='wood']          { polygon-fill: @wooded; }
    
    // Built-area landuses hidden
    // WAS: Built-area hidden when we start to show buildings
    [type = 'civil'], [type = 'commercial'], [type = 'health'], 
      [type = 'industrial'], [type = 'military'], [type = 'port'], 
      [type = 'residential'], [type = 'retail'], [type = 'railway'], 
      [type = 'school'], [type = 'garages'], [type = 'sports_centre'],
      [type = 'stadium'], [type = 'hospital'], [type = 'library'],
      [type = 'college'], [type = 'school'], [type = 'theatre'],
      [type = 'university'], [type = 'cinema'], [type='wetland'], 
      [type='nature_reserve'] {
        polygon-opacity: 0;
        //  [zoom=16]          { polygon-opacity: @fade_in_opacity_2; }
        //  [zoom>=17]         { polygon-opacity: 0; }
      }
  */
}

// Start at zoom 10 (was: 7)
#landuse_overlays[type='nature_reserve'][zoom>10] {
  line-color: darken(@wooded,25%);
  line-opacity:  0.3;
  line-dasharray: 1,1;
  polygon-fill: darken(@wooded,25%);
  polygon-opacity: 0.1;
  [zoom=8] { line-width: 0.4; }
  [zoom=9] { line-width: 0.6; }
  [zoom=10] { line-width: 0.8; }
  [zoom=11] { line-width: 1.0; }
  [zoom=12] { line-width: 1.5; }
  [zoom>=13] { line-width: 2.0; }
}
 
#landuse_overlays[type='wetland'][zoom>12] {
  // [zoom>12][zoom<=15] { polygon-pattern-file:url(img/marsh-16.png); }
  // [zoom>15] { polygon-pattern-file:url(img/marsh-32.png);}
}

/* ---- BUILDINGS ---- */
#buildings[zoom>=16][zoom<=17] {
  polygon-fill:@building;
  [zoom=16] {
    line-color:@standard_line;
    line-width:@standard_line_width;
    polygon-opacity: @fade_in_opacity_1;
    line-opacity: @fade_in_opacity_1;
  }
  [zoom=17] {
    line-color:@standard_line;
    line-width:@standard_line_width;
    polygon-opacity: 1;
    line-opacity: 1;
  }
}
// At the highest zoom levels, render buildings in fancy pseudo-3D.
// Ordering polygons by their Y-position is necessary for this effect
// so we use a separate layer that does this for us.
#buildings[zoom>=18][type != 'hedge'] {
  building-fill:lighten( @building, 3% );
  building-height:2; // Insufficient data for '[height]';
  [zoom>=19] {
    building-fill:lighten( @building, 1.5% );
    building-height:4; // Insufficient data for '[height]';
  }
}

#buildings[zoom>=18][type = 'hedge'] {
  building-fill:@wooded;
  building-height:2;
  [zoom>=19] {
    building-height:4;
  }
}

/* ---- MAN MADE ---- */
// Only piers shown. Tagging of other man_made objects inconsistent.
#man_made[zoom>=15][type = 'pier'] {
  polygon-fill:@landuse_basic;
  [zoom=15] {
    line-width:0;
    polygon-opacity: @fade_in_opacity_2;
  }
  [zoom=16] {
    line-color:@standard_line;
    line-width:@standard_line_width;
    polygon-opacity: @fade_in_opacity_3;
    line-opacity: 1;
  }
  [zoom=17] {
    line-color:@standard_line;
    line-width:@standard_line_width;
    polygon-opacity: 1;
  }
}
// Use light pseudo-3D also for piers
#man_made[zoom>=18][type = 'pier'] {
  building-fill:lighten( @landuse_basic, 3% );
  building-height:1; // Insufficient data for '[height]';
  [zoom>=19] {
    building-fill:lighten( @landuse_basic, 1.5% );
    building-height:2; // Insufficient data for '[height]';
  }
}

/* ================================================================== */
/* WATER AREAS
/* ================================================================== */

Map { background-color: @water; }

#water_gen0[zoom>4][zoom<=10],
#water_gen1[zoom>10][zoom<=13],
#water[zoom>13] {
  polygon-fill: @water;
  [zoom>=16] {
    building-fill:@water;
    building-height: -1;
  }
}

/* ================================================================== */
/* WATER WAYS
/* ================================================================== */

#waterway_low[zoom>=9][zoom<=13] {
  line-color: @water;
  [zoom=9] { line-width: 0.1; }
  [zoom=10] { line-width: 0.2; }
  [zoom=11]{ line-width: 0.4; }
  [zoom=12]{ line-width: 0.6; }
  [zoom=13]{ line-width: 0.8; }
}

#waterway_med[zoom>=14][zoom<=15] {
  line-color: @water;
  [type='river'],
  [type='canal'] {
    line-cap: round;
    line-join: round;
    [zoom=14]{ line-width: 1; }
    [zoom=15]{ line-width: 1.5; }
  }
  [type='stream'] {
    [zoom=14]{ line-width: 0.2; }
    [zoom=15]{ line-width: 0.4; }
  }
}
  
#waterway_high[zoom>=16] {
  line-color: @water;
  [type='river'],
  [type='canal'] {
    line-cap: round;
    line-join: round;
    [zoom=16]{ line-width: 2; }
    [zoom=17]{ line-width: 3; }
    [zoom=18]{ line-width: 4; }
    [zoom=19]{ line-width: 5; }
    [zoom=20]{ line-width: 6; }
    [zoom>20]{ line-width: 7; }
  }
  [type='stream'] {
    [zoom=16]{ line-width: 0.6; }
    [zoom=17]{ line-width: 0.8; }
    [zoom=18]{ line-width: 1; }
    [zoom=19]{ line-width: 1.5; }
    [zoom>19]{ line-width: 2; }
  }
  [type='ditch'],
  [type='drain'] {
    [zoom=16]{ line-width: 0.1; }
    [zoom=17]{ line-width: 0.3; }
    [zoom=18]{ line-width: 0.5; }
    [zoom=19]{ line-width: 0.7; }
    [zoom=20]{ line-width: 1; }
    [zoom>20]{ line-width: 1.5; }
  }
}

/* ================================================================== */
/* ADMINISTRATIVE BOUNDARIES
/* ================================================================== */


#admin[admin_level=2][zoom>1] {
  line-color:@admin_2;
  line-width:0.5;
  [zoom=3] { line-opacity: 0.25; }
  [zoom=4] { line-opacity: 0.3; }
  [zoom=5] { line-opacity: 0.4; }
}

/* ================================================================== */
/* BARRIER POINTS
/* ================================================================== */


#barrier_points[zoom>=18][stylegroup = 'divider'] {
  marker-height: 2;
  marker-fill: #c7c7c7;
  marker-line-opacity:0;
  marker-allow-overlap:true;
}

/* ================================================================== */
/* BARRIER LINES
/* ================================================================== */

#barrier_lines[zoom>=18][stylegroup = 'gate'] {
  line-width:2.5;
  line-color:#aab;
  line-dasharray:3,2;
}

#barrier_lines[zoom>=18][stylegroup = 'fence'] {
  line-width:1.75;
  line-color:#aab;
  line-dasharray:1,1;
}

#barrier_lines[zoom>=18][stylegroup = 'hedge'] {
  line-width:3;
  line-color:darken(@park,5%);

}



/* ================================================================== */
/* COASTLINE SHADOW EFFECT
/* ================================================================== */

#coastline_shadow {
  [zoom>=15] {
    ::shadow-1 {
      line-join:round;
      line-width:5*@coastline-shadow-step-width;
      line-color:darken( @coastline-shadow, 1*@coastline-shadow-step-fade );
    }
    ::shadow-2 {
      line-join:round;
      line-width:4*@coastline-shadow-step-width;
      line-color:darken( @coastline-shadow, 2*@coastline-shadow-step-fade );
    }
    ::shadow-3 {
      line-join:round;
      line-width:3*@coastline-shadow-step-width;
      line-color:darken( @coastline-shadow, 3*@coastline-shadow-step-fade );
    }
    ::shadow-4 {
      line-join:round;
      line-width:2*@coastline-shadow-step-width;
      line-color:darken( @coastline-shadow, 4*@coastline-shadow-step-fade );
    }
    ::shadow-5 {
      line-join:round;
      line-width:1*@coastline-shadow-step-width;
      line-color:darken( @coastline-shadow, 5*@coastline-shadow-step-fade );
    }
  }
  [zoom>=16] {
    ::shadow-1 {
      line-join:round;
      line-width:10*@coastline-shadow-step-width;
      line-color:darken( @coastline-shadow, 1*@coastline-shadow-step-fade );
    }
    ::shadow-2 {
      line-join:round;
      line-width:9*@coastline-shadow-step-width;
      line-color:darken( @coastline-shadow, 2*@coastline-shadow-step-fade );
    }
    ::shadow-3 {
      line-join:round;
      line-width:8*@coastline-shadow-step-width;
      line-color:darken( @coastline-shadow, 3*@coastline-shadow-step-fade );
    }
    ::shadow-4 {
      line-join:round;
      line-width:7*@coastline-shadow-step-width;
      line-color:darken( @coastline-shadow, 4*@coastline-shadow-step-fade );
    }
    ::shadow-5 {
      line-join:round;
      line-width:6*@coastline-shadow-step-width;
      line-color:darken( @coastline-shadow, 5*@coastline-shadow-step-fade );
    }
    ::shadow-6 {
      line-join:round;
      line-width:5*@coastline-shadow-step-width;
      line-color:darken( @coastline-shadow, 6*@coastline-shadow-step-fade );
    }
    ::shadow-7 {
      line-join:round;
      line-width:4*@coastline-shadow-step-width;
      line-color:darken( @coastline-shadow, 7*@coastline-shadow-step-fade );
    }
    ::shadow-8 {
      line-join:round;
      line-width:3*@coastline-shadow-step-width;
      line-color:darken( @coastline-shadow, 8*@coastline-shadow-step-fade );
    }
    ::shadow-9 {
      line-join:round;
      line-width:2*@coastline-shadow-step-width;
      line-color:darken( @coastline-shadow, 9*@coastline-shadow-step-fade );
    }
    ::shadow-10 {
      line-join:round;
      line-width:1*@coastline-shadow-step-width;
      line-color:darken( @coastline-shadow, 10*@coastline-shadow-step-fade );
    }
  }
}