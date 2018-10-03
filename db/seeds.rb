# frozen_string_literal: true

case Rails.env

when 'development'
  # create some users
  # super admin
  superadmin = User.create(first_name:  'Robert',
                           last_name:   'Saunders',
                           email:       'superadmin@example.com',
                           password:    'password',
                           role:        'superadmin')

  User.create(first_name:  'Student',
              last_name:   'Test',
              email:       'test@example.com',
              password:    'password',
              role:        'student')

  # hr example
  hrUser = User.create(first_name:  '',
                       last_name:   '',
                       email:       'emily@queensu.ca',
                       password:    'password',
                       role:        'student')
  User.create(first_name:  'Carson',
              last_name:   'Cook',
              email:       'carson@queensu.ca',
              password:    'password',
              role:        'student')
  User.create(first_name:  'Jill',
              last_name:   'Reid',
              email:       'jill@queensu.ca',
              password:    'password',
              role:        'student')
  User.create(first_name:  'Rob',
              last_name:   'Saunders',
              email:       'rob@queensu.ca',
              password:    'password',
              role:        'student')
  User.create(first_name:  'Peter',
              last_name:   'Ju',
              email:       'peter@queensu.ca',
              password:    'password',
              role:        'student')
  # create some users
  20.times do |n|
    email = 'test' + n.to_s + '@test.com'
    first_name = 'Tester'
    last_name = n.to_s
    password = 'password'
    role = 'student'
    User.create(
      email: email,
      first_name: first_name,
      last_name: last_name,
      password: password,
      role: role
    )
  end
  # make some organizations
  Organization.create(
    name: "Queen's Conference on Business Technology",
    email: 'qcbt@engsoc.queensu.ca',
    description: Faker::Lorem.paragraph(4, true),
    department: 'conferences'
  )

  Organization.create(
    name: "Queen's Global Innovation Conference",
    email: 'qgic@engsoc.queensu.ca',
    description: Faker::Lorem.paragraph(4, true),
    department: 'conferences'
  )

  Organization.create(
    name: 'EngLinks',
    email: 'englinks@engsoc.queensu.ca',
    description: Faker::Lorem.paragraph(4, true),
    department: 'services'
  )

  Organization.create(
    name: 'Science Quest',
    email: 'sciencequest@engsoc.queensu.ca',
    description: Faker::Lorem.paragraph(4, true),
    department: 'services'
  )

  Organization.create(
    name: 'Campus Equipment Outfitters',
    email: 'ceo@engsoc.queensu.ca',
    description: Faker::Lorem.paragraph(4, true),
    department: 'services',
    status: 'active'
  )

  Organization.create(
    name: 'Robogals',
    email: 'robogals@engsoc.queensu.ca',
    description: Faker::Lorem.paragraph(4, true),
    department: 'clubs'
  )

  Organization.create(
    name: 'IT Team',
    email: 'it.manager@engsoc.queensu.ca',
    description: Faker::Lorem.paragraph(4, true),
    department: 'information_technology',
    status: 'active'
  )

  Organization.create(
    name: "Fix N' Clean",
    email: 'fixnclean@engsoc.queensu.ca',
    description: Faker::Lorem.paragraph(4, true),
    department: 'community_outreach'
  )

  Organization.create(
    name: 'FREC Committee',
    email: 'fc@engsoc.queensu.ca',
    description: Faker::Lorem.paragraph(4, true),
    department: 'orientation_week'
  )

  Organization.create(
    name: 'Movember',
    email: 'movember@engsoc.queensu.ca',
    description: Faker::Lorem.paragraph(4, true),
    department: 'events'
  )

  Organization.create(
    name: 'Engineering Society Executive and Director Team',
    email: 'president@engsoc.queensu.ca',
    description: Faker::Lorem.paragraph(4, true),
    department: 'directors',
    status: 'active'
  )

  Organization.create(
    name: 'Clark Hall Pub',
    email: 'clarkhall@engsoc.queensu.ca',
    description: Faker::Lorem.paragraph(4, true),
    department: 'services',
    status: 'active'
  )

  # create some more regular users
  30.times do |_n|
    email = Faker::Internet.email
    password = 'password'
    User.create(email:         email,
                gender:        1,
                password:      password,
                role:          0)
  end

  # create some orgs
  20.times do |_n|
    email = Faker::Internet.email
    status = 'active'
    description = Faker::Lorem.paragraph(3, true)
    department = 'clubs'
    name = Faker::Team.name
    Organization.create(
      email: email,
      status: status,
      description: description,
      name: name,
      department: department
    )
  end

  org = Organization.create(
    name: "Queen's Global Energy Conference",
    email: 'qgec@engsoc.queensu.ca',
    description: Faker::Lorem.paragraph(4, true),
    department: 'conferences',
    status: 'active'
  )

  user = User.create(
    first_name: 'Katrina',
    last_name:   'Stirling',
    email:       'kat@queensu.ca',
    password:    'password',
    role:        'student'
  )

  job = Job.create(
    title: 'Chair',
    organization_id: org.id,
    status: 'active',
    job_type: 'volunteer',
    role: 'management',
    description: Faker::Lorem.paragraph(4, true)
  )

  Position.create(
    job_id: job.id,
    user_id: user.id,
    start_date: Time.now - 30.days,
    end_date: Time.now + 30.days
  )

  user = User.create(
    first_name: 'Peter',
    last_name: 'Ju',
    email: 'pete@queensu.ca',
    password: 'password',
    role: 'student'
  )

  job = Job.create(
    title: 'Web & IT',
    organization_id: org.id,
    status: 'active',
    job_type: 'volunteer',
    role: 'regular',
    description: Faker::Lorem.paragraph(4, true)
  )

  Position.create(
    job_id: job.id,
    user_id: user.id,
    start_date: Time.now - 30.days,
    end_date: Time.now + 30.days
  )

  user = User.create(
    first_name: 'Farhaj',
    last_name: 'Khan',
    email: 'farhaj@queensu.ca',
    password: 'password',
    role: 'student'
  )

  job = Job.create(
    title: 'Logistics & Finance',
    organization_id: org.id,
    status: 'active',
    job_type: 'volunteer',
    role: 'regular',
    description: Faker::Lorem.paragraph(4, true)
  )

  posting = JobPosting.create(
    title: job.title,
    deadline: Time.now + 30.days,
    status: 'open',
    description: Faker::Lorem.paragraph(4, true),
    job_id: job.id,
    start_date: Time.now + 40.days,
    end_date: Time.now + 240.days
  )

  question1 = JobPostingQuestion.create(
    job_posting_id: posting.id,
    content: 'Are you good at calculations and finances?'
  )

  question2 = JobPostingQuestion.create(
    job_posting_id: posting.id,
    content: 'What department are you in?'
  )

  question3 = JobPostingQuestion.create(
    job_posting_id: posting.id,
    content: 'How do you plan to raise money for QGEC?'
  )

  question4 = JobPostingQuestion.create(
    job_posting_id: posting.id,
    content: 'What books have you read in the last month?'
  )

  question5 = JobPostingQuestion.create(
    job_posting_id: posting.id,
    content: 'What time and date can you interview?'
  )

  Position.create(
    job_id: job.id,
    user_id: user.id,
    start_date: Time.now - 30.days,
    end_date: Time.now + 30.days
  )

  user = User.create(
    first_name:  'Graham',
    last_name:   'Girard',
    email:       'graham@queensu.ca',
    password:    'password',
    role:        'student'
  )

  job = Job.create(
    title: 'Head of Sponsorship',
    organization_id: org.id,
    status: 'active',
    job_type: 'volunteer',
    role: 'regular',
    description: Faker::Lorem.paragraph(4, true)
  )

  Position.create(
    job_id: job.id,
    user_id: user.id,
    start_date: Time.now - 30.days,
    end_date: Time.now + 30.days
  )

  posting = JobPosting.create(
    title: job.title,
    deadline: Time.now + 30.days,
    status: 'open',
    description: Faker::Lorem.paragraph(4, true),
    job_id: job.id,
    start_date: Time.now + 40.days,
    end_date: Time.now + 240.days
  )

  question1 = JobPostingQuestion.create(
    job_posting_id: posting.id,
    content: 'Are you comfortable talking to strangers?'
  )

  question2 = JobPostingQuestion.create(
    job_posting_id: posting.id,
    content: 'What are your favorite companies?'
  )

  question3 = JobPostingQuestion.create(
    job_posting_id: posting.id,
    content: "What are some other positions you're interested in within QGEC? They include head of IT, head of sponsorship, events coordinator, lead marketer, and more"
  )

  question4 = JobPostingQuestion.create(
    job_posting_id: posting.id,
    content: 'What books have you read in the last month?'
  )

  question5 = JobPostingQuestion.create(
    job_posting_id: posting.id,
    content: 'What time and date can you interview?'
  )

  job = Job.create(
    title: 'Head of Speakers',
    organization_id: org.id,
    status: 'active',
    job_type: 'volunteer',
    role: 'regular',
    description: Faker::Lorem.paragraph(4, true)
  )

  posting = JobPosting.create(
    title: job.title,
    deadline: Time.now + 30.days,
    status: 'open',
    description: Faker::Lorem.paragraph(4, true),
    job_id: job.id,
    start_date: Time.now + 40.days,
    end_date: Time.now + 240.days
  )

  question1 = JobPostingQuestion.create(
    job_posting_id: posting.id,
    content: 'Are you comfortable speaking in front of strangers?'
  )

  question2 = JobPostingQuestion.create(
    job_posting_id: posting.id,
    content: "Who's your fav public speaker?"
  )

  question3 = JobPostingQuestion.create(
    job_posting_id: posting.id,
    content: "What are some other positions you're interested in within QGEC? They include head of IT, head of sponsorship, events coordinator, lead marketer, and more"
  )

  question4 = JobPostingQuestion.create(
    job_posting_id: posting.id,
    content: 'What books have you read in the last month?'
  )

  question5 = JobPostingQuestion.create(
    job_posting_id: posting.id,
    content: 'What time and date can you interview?'
  )

  org = Organization.create(
    name: 'Automated Poker Team',
    email: 'qapt@engsoc.queensu.ca',
    description: Faker::Lorem.paragraph(4, true),
    department: 'clubs',
    status: 'active'
  )

  user = User.create(
    first_name: 'Stosh',
    last_name: 'Fabricus',
    email: 'stosh@queensu.ca',
    password: 'password',
    role: 'student'
  )

  job = Job.create(
    title: 'Captain',
    organization_id: org.id,
    status: 'active',
    job_type: 'volunteer',
    role: 'management',
    description: Faker::Lorem.paragraph(4, true)
  )

  Position.create(
    job_id: job.id,
    user_id: user.id,
    start_date: Time.now - 30.days,
    end_date: Time.now + 30.days
  )

  user = User.create(
    first_name: 'Robert',
    last_name: 'Sun',
    email: 'Sun@queensu.ca',
    password: 'password',
    role: 'student'
  )

  Position.create(
    job_id: job.id,
    user_id: user.id,
    start_date: Time.now - 30.days,
    end_date: Time.now + 30.days
  )

  user = User.create(
    first_name: 'Mark',
    last_name: 'Tamming',
    email: 'tamming@queensu.ca',
    password: 'password',
    role: 'student'
  )

  Position.create(
    job_id: job.id,
    user_id: user.id,
    start_date: Time.now - 300.days,
    end_date: Time.now - 60.days
  )

  user = User.create(
    first_name: 'Jacob',
    last_name: 'Markstrom',
    email: 'jacob@queensu.ca',
    password: 'password',
    role: 'student'
  )

  Position.create(
    job_id: job.id,
    user_id: user.id,
    start_date: Time.now - 600.days,
    end_date: Time.now - 300.days
  )

  job = Job.create(
    title: 'Human Resources Manager',
    organization_id: org.id,
    status: 'active',
    job_type: 'volunteer',
    role: 'management',
    description: Faker::Lorem.paragraph(4, true)
  )

  Position.create(
    job_id: job.id,
    user_id: superadmin.id,
    start_date: Time.now - 30.days,
    end_date: Time.now + 30.days
  )

  job = Job.create(
    title: 'Tournaments Researcher',
    organization_id: org.id,
    status: 'active',
    job_type: 'volunteer',
    role: 'regular',
    description: Faker::Lorem.paragraph(4, true)
  )

  user = User.create(
    first_name: 'Mario',
    last_name: 'Lemieux',
    email: 'mario@queensu.ca',
    password: 'password',
    role: 'student'
  )

  Position.create(
    job_id: job.id,
    user_id: user.id,
    start_date: Time.now - 600.days,
    end_date: Time.now - 300.days
  )

  job = Job.create(
    title: 'Bot Programmer',
    organization_id: org.id,
    status: 'active',
    job_type: 'volunteer',
    role: 'regular',
    description: Faker::Lorem.paragraph(4, true)
  )

  posting = JobPosting.create(
    title: job.title,
    deadline: Time.now + 30.days,
    status: 'open',
    description: Faker::Lorem.paragraph(4, true),
    job_id: job.id,
    start_date: Time.now + 40.days,
    end_date: Time.now + 240.days
  )

  question1 = JobPostingQuestion.create(
    job_posting_id: posting.id,
    content: 'Do you have experience with java?'
  )

  question2 = JobPostingQuestion.create(
    job_posting_id: posting.id,
    content: 'Do you know version control?'
  )

  question3 = JobPostingQuestion.create(
    job_posting_id: posting.id,
    content: 'Have you worked in a team?'
  )

  user = User.create(
    first_name: 'Chris',
    last_name: 'Barnes',
    email: 'chris@queensu.ca',
    password: 'password',
    role: 'student'
  )

  application = JobApplication.create(
    user_id: user.id,
    job_posting_id: posting.id,
    status: 'submitted'
  )

  JobPostingAnswer.create(
    content: 'Yes im java expert',
    job_posting_questions_id: question1.id,
    job_application_id: application.id
  )

  JobPostingAnswer.create(
    content: 'Git master righ here',
    job_posting_questions_id: question2.id,
    job_application_id: application.id
  )

  JobPostingAnswer.create(
    content: 'Been a manager',
    job_posting_questions_id: question3.id,
    job_application_id: application.id
  )

  Interview.create(
    job_application_id: application.id,
    start_time: Time.now,
    end_time: Time.now + 30.minutes
  )

  user = User.create(
    first_name: 'James',
    last_name: 'Pang',
    email: 'james@queensu.ca',
    password: 'password',
    role: 'student'
  )

  application = JobApplication.create(
    user_id: user.id,
    job_posting_id: posting.id,
    status: 'submitted'
  )

  JobPostingAnswer.create(
    content: "Uh Java isn't my strongsuit",
    job_posting_questions_id: question1.id,
    job_application_id: application.id
  )

  JobPostingAnswer.create(
    content: 'Mostly SVN',
    job_posting_questions_id: question2.id,
    job_application_id: application.id
  )

  JobPostingAnswer.create(
    content: "No I don't like talking",
    job_posting_questions_id: question3.id,
    job_application_id: application.id
  )

  user = User.create(
    first_name: 'Nathan',
    last_name: 'Akinson',
    email: 'nathan@queensu.ca',
    password: 'password',
    role: 'student'
  )

  application = JobApplication.create(
    user_id: user.id,
    job_posting_id: posting.id,
    status: 'submitted'
  )

  JobPostingAnswer.create(
    content: 'Is that like coffee',
    job_posting_questions_id: question1.id,
    job_application_id: application.id
  )

  JobPostingAnswer.create(
    content: 'Like version numbers?',
    job_posting_questions_id: question2.id,
    job_application_id: application.id
  )

  JobPostingAnswer.create(
    content: 'Yeah for flip cup',
    job_posting_questions_id: question3.id,
    job_application_id: application.id
  )

  user = User.create(
    first_name: 'Otto',
    last_name: 'Bismark',
    email: 'otto@queensu.ca',
    password: 'password',
    role: 'student'
  )

  application = JobApplication.create(
    user_id: user.id,
    job_posting_id: posting.id,
    status: 'submitted'
  )

  JobPostingAnswer.create(
    content: 'Jawohl',
    job_posting_questions_id: question1.id,
    job_application_id: application.id
  )

  JobPostingAnswer.create(
    content: 'Nein',
    job_posting_questions_id: question2.id,
    job_application_id: application.id
  )

  JobPostingAnswer.create(
    content: 'For the reich',
    job_posting_questions_id: question3.id,
    job_application_id: application.id
  )

  user = User.create(
    first_name: 'Steve',
    last_name: 'Jobs',
    email: 'steve@queensu.ca',
    password: 'password',
    role: 'student'
  )

  application = JobApplication.create(
    user_id: user.id,
    job_posting_id: posting.id,
    status: 'submitted'
  )

  JobPostingAnswer.create(
    content: 'Haha I invented it',
    job_posting_questions_id: question1.id,
    job_application_id: application.id
  )

  JobPostingAnswer.create(
    content: 'Yeah anything you can throw at me',
    job_posting_questions_id: question2.id,
    job_application_id: application.id
  )

  JobPostingAnswer.create(
    content: "I'm kind of a dick",
    job_posting_questions_id: question3.id,
    job_application_id: application.id
  )

  user = User.create(
    first_name: 'Mark',
    last_name: 'Zuckerberg',
    email: 'mark@queensu.ca',
    password: 'password',
    role: 'student'
  )

  application = JobApplication.create(
    user_id: user.id,
    job_posting_id: posting.id,
    status: 'submitted'
  )

  JobPostingAnswer.create(
    content: 'Too easy',
    job_posting_questions_id: question1.id,
    job_application_id: application.id
  )

  JobPostingAnswer.create(
    content: "Yes, it's crucial",
    job_posting_questions_id: question2.id,
    job_application_id: application.id
  )

  JobPostingAnswer.create(
    content: "I used to be pretty bad at it but I'm getting the hang of it now",
    job_posting_questions_id: question3.id,
    job_application_id: application.id
  )

  job = Job.create(
    title: 'Statistics Analyzer',
    organization_id: org.id,
    status: 'active',
    job_type: 'volunteer',
    role: 'regular',
    description: Faker::Lorem.paragraph(4, true)
  )

  posting = JobPosting.create(
    title: job.title,
    deadline: Time.now + 30.days,
    status: 'open',
    description: Faker::Lorem.paragraph(4, true),
    job_id: job.id,
    start_date: Time.now + 40.days,
    end_date: Time.now + 240.days
  )

  question1 = JobPostingQuestion.create(
    job_posting_id: posting.id,
    content: 'Do you have experience with R?'
  )

  question2 = JobPostingQuestion.create(
    job_posting_id: posting.id,
    content: 'How did you find out about QAPT?'
  )

  question3 = JobPostingQuestion.create(
    job_posting_id: posting.id,
    content: 'Have you worked in a team?'
  )

  user = User.create(
    first_name: 'Spencer',
    last_name: 'Evans',
    email: 'spencer@queensu.ca',
    password: 'password',
    role: 'student'
  )

  application = JobApplication.create(
    user_id: user.id,
    job_posting_id: posting.id,
    status: 'submitted'
  )

  JobPostingAnswer.create(
    content: 'Yes from my econ classes',
    job_posting_questions_id: question1.id,
    job_application_id: application.id
  )

  JobPostingAnswer.create(
    content: 'From a poker tournament',
    job_posting_questions_id: question2.id,
    job_application_id: application.id
  )

  JobPostingAnswer.create(
    content: "Yee whacha sayin b'y",
    job_posting_questions_id: question3.id,
    job_application_id: application.id
  )

  user = User.create(
    first_name: 'John',
    last_name: 'Nash',
    email: 'john@queensu.ca',
    password: 'password',
    role: 'student'
  )

  application = JobApplication.create(
    user_id: user.id,
    job_posting_id: posting.id,
    status: 'submitted'
  )

  JobPostingAnswer.create(
    content: 'No just pen and paper for me',
    job_posting_questions_id: question1.id,
    job_application_id: application.id
  )

  JobPostingAnswer.create(
    content: 'From a poker tournament',
    job_posting_questions_id: question2.id,
    job_application_id: application.id
  )

  JobPostingAnswer.create(
    content: "I'm actually insane",
    job_posting_questions_id: question3.id,
    job_application_id: application.id
  )

  user = User.create(
    first_name: 'Julius',
    last_name: 'Antonius',
    email: 'julius@queensu.ca',
    password: 'password',
    role: 'student'
  )

  application = JobApplication.create(
    user_id: user.id,
    job_posting_id: posting.id,
    status: 'submitted'
  )

  JobPostingAnswer.create(
    content: Faker::Lorem.paragraph(4, true),
    job_posting_questions_id: question1.id,
    job_application_id: application.id
  )

  JobPostingAnswer.create(
    content: Faker::Lorem.paragraph(4, true),
    job_posting_questions_id: question2.id,
    job_application_id: application.id
  )

  JobPostingAnswer.create(
    content: Faker::Lorem.paragraph(4, true),
    job_posting_questions_id: question3.id,
    job_application_id: application.id
  )

  user = User.create(
    first_name: 'Cleo',
    last_name: 'Patra',
    email: 'cleo@queensu.ca',
    password: 'password',
    role: 'student'
  )

  application = JobApplication.create(
    user_id: user.id,
    job_posting_id: posting.id,
    status: 'submitted'
  )

  JobPostingAnswer.create(
    content: Faker::Lorem.paragraph(4, true),
    job_posting_questions_id: question1.id,
    job_application_id: application.id
  )

  JobPostingAnswer.create(
    content: Faker::Lorem.paragraph(4, true),
    job_posting_questions_id: question2.id,
    job_application_id: application.id
  )

  JobPostingAnswer.create(
    content: Faker::Lorem.paragraph(4, true),
    job_posting_questions_id: question3.id,
    job_application_id: application.id
  )
end
