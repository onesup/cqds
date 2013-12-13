module ApplicationHelper
  A_BOX_PER_FANS = 100
  def extract_tens(number)
    tens = (number / 10) * 10
    ones = number % 10
    [tens, ones]
  end
  
  def fans_to_boxes(fans_count)
    boxes = fans_count / A_BOX_PER_FANS
  end
  
  def box_set(fans_count)
    boxes = fans_to_boxes(fans_count)
    result = [0, 0, 0]
    case boxes
    when 0..20
      result = [boxes, 0, 0]
    when 21..60
      result = [20, boxes - 20, 0]
    when 61..120
      result = [20, 40, boxes - (20+40)]
    else
      result = [20, 40, 60]
    end
    result
  end
  
  def first_blocks(boxes_count)
    result = [0,0]
    result = fill_boxes(boxes_count, result)
  end
  
  def second_blocks(boxes_count)
    result = [0,0,0,0]
    result = fill_boxes(boxes_count, result)
  end
  
  def third_blocks(boxes_count)
    result = [0,0,0,0,0,0]
    result = fill_boxes(boxes_count, result)
  end
  
  def fill_boxes(boxes_count, boxes_array)
    filled_boxes = extract_tens(boxes_count)
    boxes_array[-1] = filled_boxes.last
    unless filled_boxes.first == 0
      (filled_boxes.first / 10).times do |n|
        boxes_array = boxes_array.rotate(1)
        boxes_array[-1] = 10
      end
    end
    boxes_array
  end
  
  def render_a_box_group(group_name, boxes_count)
    result = String.new
    eval("#{group_name}_blocks(boxes_count)").each do |number|
      result << render_a_line(number)
    end
    result
    
  end
  
  def number_to_image_tag(number)
    number = "%07d" % number
    parts = number.split(".")
    parts[0].gsub!(/(\d)(?=(\d\d\d)+(?!\d))/, "\\1,")
    numbers = parts.join
    numbers = numbers.gsub(/./){|s| '<li class="num">' + s + '</li>'}
    numbers = numbers.gsub(/\<li class\=\"num\"\>\,\<\/li\>/){|s| '<li>,</li>'}
  end
  
  def number_to_big_image_tag(number)
    parts = number.to_s
    add_zeros = "0" * (7 - parts.length)
    parts = parts.insert(0, add_zeros)
    parts.gsub!(/(\d)(?=(\d\d\d)+(?!\d))/, "\\1,")
    numbers = parts
    numbers = numbers.gsub(/./){|s| content_tag(:div, image_tag('page_tab/num/' + s + '.jpg'), class: "n")}
    numbers = numbers.gsub(/\<div class\=\"n\"\>\<img alt\=\"\,\" src\=\"\/images\/page\_tab\/num\/\,\.jpg\" \/\>\<\/div\>/){|s| '<div class="n spacer">&nbsp</div>'}
  end
  
  def number_to_big_image_tag_for_org(number)
    # http://www.miraclehospital.org/img/common/img/sns_event_num6.gif
    parts = number.to_s
    add_zeros = "0" * (7 - parts.length)
    parts = parts.insert(0, add_zeros)
    parts.gsub!(/(\d)(?=(\d\d\d)+(?!\d))/, "\\1,")
    numbers = parts
    numbers = numbers.gsub(/./){|s| "<div class='n'><img alt='"+s+"' src='img/common/img/sns_event_num" + s + ".jpg' /></div>"}
    numbers = numbers.gsub(/\<div class\=\'n\'\>\<img alt\=\'\,\' src\=\'img\/common\/img\/sns_event_num\,\.jpg\' \/\>\<\/div\>/){|s| "<div class='n spacer'>&nbsp</div>"}
  end

  
  def render_stage1(heros)
    stocks = fans_to_boxes(heros)[0]
    boxes = stocks.first
    stocks = stocks.last
    if stocks == 20
      blanks = "<li class='blank'></li>" * stocks
      result = blanks
    elsif stocks < 20 and stocks >= 10
      blanks2 = "<li class='blank'></li>" * (stocks - 10)
      fills1 = "<li class='fill_01'></li>" * (boxes - stocks)
      blanks1 = "<li class='blank'></li>" * 10
      result = blanks1 + fills1 + blanks2
    elsif stocks < 9
      # blanks1 = '<li class="blank"></li>' * (10)
      blanks1 = "<li class='blank'></li>" * (stocks)
      fills1 = "<li class='fill_01'></li>" * ((boxes - stocks) - 10)
      fills2 = "<li class='fill_01'></li>" * 10 
      result = fills1 + blanks1 + fills2
    end
    result
  end
  
  def render_a_line(ones)
    init_line = [nil,nil,nil,nil,nil, nil,nil,nil,nil,nil]
    ones.times do |n|
      init_line[n] = 1
    end
    result = String.new
    init_line.each do |box|
      if box.nil?
        result << "<li class='blank'></li>"
      else
        result << '<li class="fill_01"></li>'
      end
    end
    result
  end
  
  
  
  def time_iterate(start_time, end_time, step, &block)
    begin
      yield(start_time)
    end while (start_time += step) <= end_time
  end
  
end
