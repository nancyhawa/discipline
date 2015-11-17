class XMLParser

  def initialize(file)
    @file = file
    @doc = Nokogiri::XML(File.open(@file)).remove_namespaces!
  end

  def build_students_from_xml
    rows.each do |row|
      build_student(row)
    end
  end

  def rows
    rows = @doc.xpath("//Row")[3..-10]
  end

  def hash_keys
    @doc.xpath("//Row")[2].xpath("Cell").map { |cell| cell.text }
  end

  def row_cells(row)
    row.xpath("Cell").map { |cell| cell.text }
  end

  def generate_student_data_hash(row)
    data = Hash[hash_keys.zip(row_cells(row))]
    parse_student_name(data)
    return data
  end

  def parse_student_name(data)
    if data["Student Name"].split(" ").length > 2
      first_and_last = data["Student Name"].split(" ")[0..1]
      data["Student Name"] = first_and_last.join(" ")
    end
    data["last_name"] = data["Student Name"].split(" ")[0].capitalize
    data["first_name"] = data["Student Name"].split(" ")[1].capitalize
  end

  def build_student(row)
    data = generate_student_data_hash(row)
    Student.create(
      first_name: data["first_name"],
      last_name: data["last_name"],
      osis_number: data["Student ID"],
      grade: data["Grade Level"].to_i,
      meal_code: data["Meal Code"],
      birthdate: data["Birth Date"],
      school_id: 1, #temporary for testing
      phone: data["Phone Number"],
    )
    end
  end
