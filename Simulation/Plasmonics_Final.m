function out = model
%
% Plasmonics_Final.m
%
% Model exported on Feb 27 2021, 18:55 by COMSOL 5.3.1.229.

import com.comsol.model.*
import com.comsol.model.util.*

model = ModelUtil.create('Model');

model.modelPath('C:\Users\Anusha\Downloads');

model.label('Plasmonics_Final.mph');

model.param.set('period', '980[nm]', 'Period');
model.param.set('h_substrate', '1000[nm]');
model.param.set('h_analyte', 'lambda');
model.param.set('n_substrate', '1.46');
model.param.set('n_analyte', '1.313');
model.param.set('n_dielectric', '2.5', 'Refractive Index of Dielectric');
model.param.set('h_metal', '50[nm]', 'Metal Thickness');
model.param.set('h_dielectric', '135[nm]', 'f');
model.param.set('w_dielectric', 'D*period');
model.param.set('wp', '2*pi*2.1520[PHz]', 'Properties of Gold');
model.param.set('gamma', '2*pi*1.6926[THz]', 'Properties of Gold');
model.param.set('eps_inf', '6.9', 'Properties of Gold');
model.param.set('lambda', '1550[nm]', 'Frequency');
model.param.set('f1', 'c_const/lambda');
model.param.set('D', '0.5102', 'Duty Cycle');

model.component.create('comp1', true);

model.component('comp1').geom.create('geom1', 2);

model.component('comp1').mesh.create('mesh1');

model.component('comp1').geom('geom1').lengthUnit('nm');
model.component('comp1').geom('geom1').create('r1', 'Rectangle');
model.component('comp1').geom('geom1').feature('r1').label('Substrate');
model.component('comp1').geom('geom1').feature('r1').set('size', {'period' 'h_substrate'});
model.component('comp1').geom('geom1').create('r2', 'Rectangle');
model.component('comp1').geom('geom1').feature('r2').label('Metal');
model.component('comp1').geom('geom1').feature('r2').set('pos', {'0' 'h_substrate'});
model.component('comp1').geom('geom1').feature('r2').set('size', {'period' 'h_metal'});
model.component('comp1').geom('geom1').create('r3', 'Rectangle');
model.component('comp1').geom('geom1').feature('r3').label('Dielectric');
model.component('comp1').geom('geom1').feature('r3').set('pos', {'(period/2) - (w_dielectric/2)' 'h_substrate+h_metal'});
model.component('comp1').geom('geom1').feature('r3').set('size', {'w_dielectric' 'h_dielectric'});
model.component('comp1').geom('geom1').create('r4', 'Rectangle');
model.component('comp1').geom('geom1').feature('r4').label('Analyte Region');
model.component('comp1').geom('geom1').feature('r4').set('pos', {'0' 'h_substrate+h_metal'});
model.component('comp1').geom('geom1').feature('r4').set('size', {'period' 'h_analyte'});
model.component('comp1').geom('geom1').run;
model.component('comp1').geom('geom1').run('fin');

model.component('comp1').physics.create('emw', 'ElectromagneticWaves', 'geom1');
model.component('comp1').physics('emw').create('wee2', 'WaveEquationElectric', 2);
model.component('comp1').physics('emw').feature('wee2').selection.set([3]);
model.component('comp1').physics('emw').create('wee3', 'WaveEquationElectric', 2);
model.component('comp1').physics('emw').feature('wee3').selection.set([1]);
model.component('comp1').physics('emw').create('wee4', 'WaveEquationElectric', 2);
model.component('comp1').physics('emw').feature('wee4').selection.set([2]);
model.component('comp1').physics('emw').create('wee5', 'WaveEquationElectric', 2);
model.component('comp1').physics('emw').feature('wee5').selection.set([4]);
model.component('comp1').physics('emw').create('pc1', 'PeriodicCondition', 1);
model.component('comp1').physics('emw').feature('pc1').selection.set([5 15]);
model.component('comp1').physics('emw').create('pc2', 'PeriodicCondition', 1);
model.component('comp1').physics('emw').feature('pc2').selection.set([3 14]);
model.component('comp1').physics('emw').create('pc3', 'PeriodicCondition', 1);
model.component('comp1').physics('emw').feature('pc3').selection.set([1 13]);
model.component('comp1').physics('emw').create('port1', 'Port', 1);
model.component('comp1').physics('emw').feature('port1').selection.set([7]);
model.component('comp1').physics('emw').create('port2', 'Port', 1);
model.component('comp1').physics('emw').feature('port2').selection.set([2]);

model.component('comp1').mesh('mesh1').create('edg1', 'Edge');
model.component('comp1').mesh('mesh1').create('cpe1', 'CopyEdge');
model.component('comp1').mesh('mesh1').create('cpe2', 'CopyEdge');
model.component('comp1').mesh('mesh1').create('cpe3', 'CopyEdge');
model.component('comp1').mesh('mesh1').create('ftri1', 'FreeTri');
model.component('comp1').mesh('mesh1').feature('edg1').selection.set([1 3 5]);

model.component('comp1').view('view1').axis.set('xmin', -1743.636474609375);
model.component('comp1').view('view1').axis.set('xmax', 2723.636474609375);
model.component('comp1').view('view1').axis.set('ymin', -65.0001220703125);
model.component('comp1').view('view1').axis.set('ymax', 2665);
model.component('comp1').view('view1').axis.set('abstractviewlratio', -2.421351432800293);
model.component('comp1').view('view1').axis.set('abstractviewrratio', 2.421351432800293);
model.component('comp1').view('view1').axis.set('abstractviewbratio', -0.05000000074505806);
model.component('comp1').view('view1').axis.set('abstractviewtratio', 0.05000000074505806);
model.component('comp1').view('view1').axis.set('abstractviewxscale', 5.848670482635498);
model.component('comp1').view('view1').axis.set('abstractviewyscale', 5.848670959472656);

model.component('comp1').physics('emw').feature('wee2').set('DisplacementFieldModel', 'RefractiveIndex');
model.component('comp1').physics('emw').feature('wee2').set('n', {'n_analyte'; '0'; '0'; '0'; 'n_analyte'; '0'; '0'; '0'; 'n_analyte'});
model.component('comp1').physics('emw').feature('wee2').label('Analyte');
model.component('comp1').physics('emw').feature('wee3').set('DisplacementFieldModel', 'RefractiveIndex');
model.component('comp1').physics('emw').feature('wee3').set('n', {'n_substrate'; '0'; '0'; '0'; 'n_substrate'; '0'; '0'; '0'; 'n_substrate'});
model.component('comp1').physics('emw').feature('wee3').label('Substrate');
model.component('comp1').physics('emw').feature('wee4').set('DisplacementFieldModel', 'DielectricLoss');
model.component('comp1').physics('emw').feature('wee4').set('epsilonBis', {'imag(eps_inf-(wp^2/(2*pi*freq*(2*pi*freq+i*gamma))))'; '0'; '0'; '0'; 'imag(eps_inf-(wp^2/(2*pi*freq*(2*pi*freq+i*gamma))))'; '0'; '0'; '0'; 'imag(eps_inf-(wp^2/(2*pi*freq*(2*pi*freq+i*gamma))))'});
model.component('comp1').physics('emw').feature('wee4').set('epsilonPrim', {'real(eps_inf-(wp^2/(2*pi*freq*(2*pi*freq+i*gamma))))'; '0'; '0'; '0'; 'real(eps_inf-(wp^2/(2*pi*freq*(2*pi*freq+i*gamma))))'; '0'; '0'; '0'; 'real(eps_inf-(wp^2/(2*pi*freq*(2*pi*freq+i*gamma))))'});
model.component('comp1').physics('emw').feature('wee4').label('Metal Layer ');
model.component('comp1').physics('emw').feature('wee5').set('DisplacementFieldModel', 'RefractiveIndex');
model.component('comp1').physics('emw').feature('wee5').set('n', {'n_dielectric'; '0'; '0'; '0'; 'n_dielectric'; '0'; '0'; '0'; 'n_dielectric'});
model.component('comp1').physics('emw').feature('wee5').label('Dielectric');
model.component('comp1').physics('emw').feature('pc1').set('PeriodicType', 'Floquet');
model.component('comp1').physics('emw').feature('pc1').set('Floquet_source', 'FromPeriodicPort');
model.component('comp1').physics('emw').feature('pc1').set('constraintMethod', 'elemental');
model.component('comp1').physics('emw').feature('pc2').set('PeriodicType', 'Floquet');
model.component('comp1').physics('emw').feature('pc2').set('Floquet_source', 'FromPeriodicPort');
model.component('comp1').physics('emw').feature('pc2').set('constraintMethod', 'elemental');
model.component('comp1').physics('emw').feature('pc3').set('PeriodicType', 'Floquet');
model.component('comp1').physics('emw').feature('pc3').set('Floquet_source', 'FromPeriodicPort');
model.component('comp1').physics('emw').feature('pc3').set('constraintMethod', 'elemental');
model.component('comp1').physics('emw').feature('port1').set('PortType', 'Periodic');
model.component('comp1').physics('emw').feature('port1').set('InputType', 'H');
model.component('comp1').physics('emw').feature('port1').set('H0', [0; 0; 1]);
model.component('comp1').physics('emw').feature('port1').set('Hampl', [0; 0; 1]);
model.component('comp1').physics('emw').feature('port1').set('n', {'n_analyte'; '0'; '0'; '0'; 'n_analyte'; '0'; '0'; '0'; 'n_analyte'});
model.component('comp1').physics('emw').feature('port1').set('IncludeInAutomaticDiffractionOrderCalculation', false);
model.component('comp1').physics('emw').feature('port2').set('PortType', 'Periodic');
model.component('comp1').physics('emw').feature('port2').set('InputType', 'H');
model.component('comp1').physics('emw').feature('port2').set('H0', [0; 0; 1]);
model.component('comp1').physics('emw').feature('port2').set('Hampl', [0; 0; 1]);
model.component('comp1').physics('emw').feature('port2').set('n', {'n_substrate'; '0'; '0'; '0'; 'n_substrate'; '0'; '0'; '0'; 'n_substrate'});
model.component('comp1').physics('emw').feature('port2').set('IncludeInAutomaticDiffractionOrderCalculation', false);

model.component('comp1').mesh('mesh1').feature('size').set('hauto', 1);
model.component('comp1').mesh('mesh1').feature('cpe1').selection('source').set([5]);
model.component('comp1').mesh('mesh1').feature('cpe1').selection('destination').set([15]);
model.component('comp1').mesh('mesh1').feature('cpe2').selection('source').set([3]);
model.component('comp1').mesh('mesh1').feature('cpe2').selection('destination').set([14]);
model.component('comp1').mesh('mesh1').feature('cpe3').selection('source').set([1]);
model.component('comp1').mesh('mesh1').feature('cpe3').selection('destination').set([13]);
model.component('comp1').mesh('mesh1').run;

model.component('comp1').physics('emw').feature('wee2').set('n_mat', 'userdef');
model.component('comp1').physics('emw').feature('wee2').set('ki_mat', 'userdef');
model.component('comp1').physics('emw').feature('wee3').set('n_mat', 'userdef');
model.component('comp1').physics('emw').feature('wee3').set('ki_mat', 'userdef');
model.component('comp1').physics('emw').feature('wee4').set('epsilonBis_mat', 'userdef');
model.component('comp1').physics('emw').feature('wee4').set('epsilonPrim_mat', 'userdef');
model.component('comp1').physics('emw').feature('wee4').set('epsilonInf_mat', 'userdef');
model.component('comp1').physics('emw').feature('wee4').set('mur_mat', 'userdef');
model.component('comp1').physics('emw').feature('wee4').set('sigma_mat', 'userdef');
model.component('comp1').physics('emw').feature('wee5').set('n_mat', 'userdef');
model.component('comp1').physics('emw').feature('wee5').set('ki_mat', 'userdef');

model.study.create('std1');
model.study('std1').create('freq', 'Frequency');

model.sol.create('sol1');
model.sol('sol1').study('std1');
model.sol('sol1').attach('std1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').create('p1', 'Parametric');
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').create('d1', 'Direct');
model.sol('sol1').feature('s1').feature.remove('fcDef');

model.result.create('pg1', 'PlotGroup2D');
model.result.create('pg2', 'PlotGroup1D');
model.result.create('pg3', 'SmithGroup');
model.result('pg1').create('surf1', 'Surface');
model.result('pg2').create('glob1', 'Global');
model.result('pg3').create('rgr1', 'ReflectionGraph');
model.result('pg3').feature('rgr1').create('col1', 'Color');
% model.result.export.create('plot1', 'Plot');
% model.result.export.create('plot2', 'Plot');

model.study('std1').feature('freq').set('punit', 'THz');
model.study('std1').feature('freq').set('plist', 'range(175,50/250,225)');

model.sol('sol1').attach('std1');
model.sol('sol1').feature('v1').set('clistctrl', {'p1'});
model.sol('sol1').feature('v1').set('cname', {'freq'});
model.sol('sol1').feature('v1').set('clist', {'range(175,50/250,225)[THz]'});
model.sol('sol1').feature('s1').set('stol', 0.01);
model.sol('sol1').feature('s1').feature('aDef').set('complexfun', true);
model.sol('sol1').feature('s1').feature('p1').set('pname', {'freq'});
model.sol('sol1').feature('s1').feature('p1').set('plistarr', {'range(175,50/250,225)'});
model.sol('sol1').feature('s1').feature('p1').set('punit', {'THz'});
model.sol('sol1').feature('s1').feature('p1').set('pcontinuationmode', 'no');
model.sol('sol1').feature('s1').feature('p1').set('preusesol', 'auto');
model.sol('sol1').feature('s1').feature('d1').label('Suggested Direct Solver (emw)');
model.sol('sol1').feature('s1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').runAll;

model.result('pg1').label('Electric Field (emw)');
model.result('pg1').set('frametype', 'spatial');
model.result('pg1').feature('surf1').label('Surface');
model.result('pg1').feature('surf1').set('smooth', 'internal');
model.result('pg1').feature('surf1').set('resolution', 'normal');
model.result('pg2').label('S-Parameter (emw)');
model.result('pg2').set('xlabel', 'Frequency (THz)');
model.result('pg2').set('ylabel', 'S-parameter (dB)');
model.result('pg2').set('ylabelactive', true);
model.result('pg2').set('xlabelactive', false);
model.result('pg2').feature('glob1').set('expr', {'emw.S11dB'});
model.result('pg2').feature('glob1').set('unit', {'1'});
model.result('pg2').feature('glob1').set('descr', {'S11'});
model.result('pg2').feature('glob1').set('titletype', 'none');
model.result('pg2').feature('glob1').set('xdata', 'expr');
model.result('pg2').feature('glob1').set('xdataexpr', 'freq');
model.result('pg2').feature('glob1').set('xdataunit', 'THz');
model.result('pg2').feature('glob1').set('xdatadescr', 'Frequency');
model.result('pg3').label('Smith Plot (emw)');
model.result('pg3').feature('rgr1').set('titletype', 'manual');
model.result('pg3').feature('rgr1').set('title', 'Reflection Graph: S-parameter, Color: Frequency (GHz)');
model.result('pg3').feature('rgr1').set('linemarker', 'point');
model.result('pg3').feature('rgr1').set('markerpos', 'datapoints');
model.result('pg3').feature('rgr1').feature('col1').set('expr', 'emw.freq/1e9');
model.result('pg3').feature('rgr1').feature('col1').set('unit', 'Hz');
model.result('pg3').feature('rgr1').feature('col1').set('descr', 'emw.freq/1e9');
model.result('pg3').feature('rgr1').feature('col1').set('colortable', 'Spectrum');

j=0;
for i=1160:5:1200
    p = num2str(i);
    model.param.set('period', [p '[nm]']);
    for d=0.25:0.01:0.9
        dc = num2str(d);
        model.param.set('D', dc, 'Duty Cycle');
        model.component('comp1').geom('geom1').run('fin');

        model.component('comp1').mesh('mesh1').run;

        model.sol('sol1').study('std1');

        model.study('std1').feature('freq').set('notlistsolnum', 1);
        model.study('std1').feature('freq').set('notsolnum', 'auto');
        model.study('std1').feature('freq').set('listsolnum', 1);
        model.study('std1').feature('freq').set('solnum', 'auto');

        model.sol('sol1').feature.remove('s1');
        model.sol('sol1').feature.remove('v1');
        model.sol('sol1').feature.remove('st1');
        model.sol('sol1').create('st1', 'StudyStep');
        model.sol('sol1').feature('st1').set('study', 'std1');
        model.sol('sol1').feature('st1').set('studystep', 'freq');
        model.sol('sol1').create('v1', 'Variables');
        model.sol('sol1').feature('v1').set('control', 'freq');
        model.sol('sol1').create('s1', 'Stationary');
        model.sol('sol1').feature('s1').set('stol', 0.01);
        model.sol('sol1').feature('s1').create('p1', 'Parametric');
        model.sol('sol1').feature('s1').feature.remove('pDef');
        model.sol('sol1').feature('s1').feature('p1').set('pname', {'freq'});
        model.sol('sol1').feature('s1').feature('p1').set('plistarr', {'range(175,50/250,225)'});
        model.sol('sol1').feature('s1').feature('p1').set('punit', {'THz'});
        model.sol('sol1').feature('s1').feature('p1').set('pcontinuationmode', 'no');
        model.sol('sol1').feature('s1').feature('p1').set('preusesol', 'auto');
        model.sol('sol1').feature('s1').feature('p1').set('pdistrib', 'off');
        model.sol('sol1').feature('s1').feature('p1').set('plot', 'off');
        model.sol('sol1').feature('s1').feature('p1').set('plotgroup', 'pg1');
        model.sol('sol1').feature('s1').feature('p1').set('probesel', 'all');
        model.sol('sol1').feature('s1').feature('p1').set('probes', {});
        model.sol('sol1').feature('s1').feature('p1').set('control', 'freq');
        model.sol('sol1').feature('s1').set('control', 'freq');
        model.sol('sol1').feature('s1').feature('aDef').set('complexfun', true);
        model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
        model.sol('sol1').feature('s1').create('d1', 'Direct');
        model.sol('sol1').feature('s1').feature('d1').set('linsolver', 'pardiso');
        model.sol('sol1').feature('s1').feature('d1').label('Suggested Direct Solver (emw)');
        model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'd1');
        model.sol('sol1').feature('s1').feature.remove('fcDef');
        model.sol('sol1').attach('std1');
        model.sol('sol1').runAll;

        model.result('pg1').run;
        model.result('pg2').run;
        model.result('pg2').run;
        j= j+1
        j1 = num2str(j);
        plot = ['plot' j1];
        model.result.export.create(plot, 'pg2', 'glob1', 'Plot');
        model.result.export(plot).set('fullprec', false);
        model.result.export(plot).set('header', false);
        v = ['period' '_' p];
        y = ['C:\Users\Anusha\Desktop\FYP-WORKING\Final-Year-Project\plasmonics\duty_cycle\' v '\' dc '.txt'];
        model.result.export(plot).set('filename', y);
        model.result.export(plot).run;
    end
end
out = model;
