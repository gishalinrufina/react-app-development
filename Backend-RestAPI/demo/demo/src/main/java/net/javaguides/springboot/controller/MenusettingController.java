package net.javaguides.springboot.controller;
import lombok.AllArgsConstructor;
import net.javaguides.springboot.entity.Menusetting;
import net.javaguides.springboot.service.MenusettingService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;
@RestController
@AllArgsConstructor
@RequestMapping("menu-setting")
public class MenusettingController {
    private MenusettingService menusettingService;
    // build create User REST API]
    @PostMapping
    public ResponseEntity<Menusetting>mcreate(@RequestBody Menusetting menusetting){
        Menusetting savedmenusetting = menusettingService.mcreate(menusetting);
        return new ResponseEntity<>(savedmenusetting, HttpStatus.CREATED);
    }

    // build get user by id REST API
    // http://localhost:8080/api/menu-setting/1
    @GetMapping("{id}")
    public ResponseEntity<Menusetting>mretrivebyid(@PathVariable("id") Long userId){
       Menusetting menusetting = menusettingService.mretrivebyid(userId);
        return new ResponseEntity<>(menusetting, HttpStatus.OK);
    }

    // Build Get All Users REST API
    @GetMapping
    public ResponseEntity<List<Menusetting>>mretriveall(){
        List<Menusetting> menusetting = menusettingService.mretriveall();
        return new ResponseEntity<>(menusetting, HttpStatus.OK);
    }

    // Build Update User REST API
    @PutMapping("{id}")
    // http://localhost:8080/api/menu-setting/1
    public ResponseEntity<Menusetting>update(@PathVariable("id") Long userId,
                                                         @RequestBody Menusetting menusetting){
        menusetting.setId(userId);
       Menusetting updatedMenusetting = menusettingService.mupdate(menusetting);
        return new ResponseEntity<>(updatedMenusetting, HttpStatus.OK);
    }

    // Build Delete User REST API
    @DeleteMapping("{id}")
    public ResponseEntity<String>delete(@PathVariable("id") Long userId){
       menusettingService.mdelete(userId);
        return new ResponseEntity<>("Menu  successfully deleted!", HttpStatus.OK);
    }
}
