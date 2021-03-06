class PseudonymController < UIViewController
  attr_accessor :pseudonym

  def init
    super
    self.title = "Profile"
    self.tabBarItem = UITabBarItem.alloc.initWithTitle("Profile", image:UIImage.imageNamed("Profile"), tag:1)
    self.pseudonym = {name: "", bio: ""}
    self
  end

  def viewDidLoad
   self.navigationController.navigationBar.translucent = false

   self.navigationItem.rightBarButtonItem = saveButton

    self.view.backgroundColor = UIColor.whiteColor
    @pseudonymView = PseudonymView.alloc.initWithFrame(self.view.frame, andPseudonym:self.pseudonym)
    self.view.addSubview(@pseudonymView)
  end

  def saveButton
    @saveButton ||= UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemSave, target:self, action:'save')
  end

  def save
    @pseudonymView.subviews.each { |v| v.resignFirstResponder }
    self.pseudonym[:name] = @pseudonymView.nameField.text
    self.pseudonym[:bio] = @pseudonymView.bioField.text

    alert = UIAlertController.alertControllerWithTitle('Profile Updated',
                                                       message: nil,
                                                       preferredStyle: UIAlertControllerStyleAlert)
    action = UIAlertAction.actionWithTitle('Ok', style: UIAlertActionStyleDefault, handler: nil)
    alert.addAction(action)
    presentViewController(alert, animated: true, completion: nil)
  end

end
