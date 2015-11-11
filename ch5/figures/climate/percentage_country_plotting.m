clear cll;
clc;
data = textread('vene_data.txt');
month = zeros(1,53);
for i=1:53
    month(i) =i;
end

%month = ['2011-01','2011-02','2011-03','2011-04','2011-05','2011-06','2011-07','2011-08','2011-09','2011-10','2011-11','2011-12','2012-01','2012-02','2012-03','2012-04','2012-05','2012-06','2012-07','2012-08','2012-09','2012-10','2012-11','2012-12','2013-01','2013-02','2013-03','2013-04','2013-05','2013-06','2013-07','2013-08','2013-09','2013-10','2013-11','2013-12','2014-01','2014-02','2014-03','2014-04','2014-05','2014-06','2014-07','2014-08','2014-09','2014-10','2014-11','2014-12','2015-01','2015-02','2015-03','2015-04','2015-05']
timeLabel = ['May-2012'; 'Jun-2012'; 'Jul-2012'; 'Aug-2012'; 'Sep-2012'; 'Oct-2012'; 'Nov-2012'; 'Dec-2012'; 'Jan-2013'; 'Feb-2013'; 'Mar-2013'; 'Apr-2013'; 'May-2013'; 'Jun-2013'; 'Jul-2013'; 'Aug-2013'; 'Sep-2013'; 'Oct-2013'; 'Nov-2013'; 'Dec-2013'; 'Jan-2014'; 'Feb-2014'; 'Mar-2014'; 'Apr-2014'; 'May-2014'; 'Jun-2014'; 'Jul-2014'; 'Aug-2014'; 'Sep-2014'; 'Oct-2014'; 'Nov-2014'; 'Dec-2014'; 'Jan-2015'; 'Feb-2015'; 'Mar-2015'; 'Apr-2015'; 'May-2015'];
timeLabel_2 = downsample(timeLabel,2);

gsr_event = data(1:53);
climate_event = data(54:106);

percentage = zeros(53,1);

for i = 1:length(gsr_event)
    if(gsr_event(i)>5)
        percentage(i) = climate_event(i)/gsr_event(i);
    end       
end


figure(1);
subplot(1,2,1);
[ax,h1,h2] = plotyy(month, gsr_event, month, climate_event);
set(h1,'linewidth',5)% to change the first line
set(h2,'linewidth',5)% to change the first line

ylabel('Events Freuency');
title(['\fontsize{20}Venezuela']);
xlim([16 53])
set(gca,'XTick',16:2:53);
set(gca,'XTickLabel',timeLabel_2);
set(gca,'XTickLabelRotation',90);
set(gca,'FontSize',12);
AX = legend('GSR Events','Climate Events','Location','northwest');
set(ax,'FontSize',12);
set(gca,'linewidth',3);
set(ax(1),'ycolor','k') 
set(ax(2),'ycolor','k')
set(h2,'color',[.7 .5 0])

subplot(1,2,2);
bar(month, percentage*100,'FaceColor',[0 .5 .5],'EdgeColor',[0 .9 .9],'LineWidth',1.5);
ylabel('Climate Events Percentage (%)');
title(['\fontsize{20}Venezuela']);
xlim([16 53])
set(gca,'XTick',16:2:53);
set(gca,'XTickLabel',timeLabel_2);
set(gca,'XTickLabelRotation',90);
set(gca,'FontSize',12)
set(gca,'linewidth',3)
print('Venezuela_again_picture','-dpng')
