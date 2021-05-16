package com.wind.service.impl;

import com.wind.entity.Pet;
import com.wind.mapper.PetMapper;
import com.wind.service.PetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Mr Wu
 * @create: 2019-08-21 10:59
 */

@Service
public class PetServiceImpl implements PetService {

    @Autowired
    private PetMapper petMapper;
    @Override
    public int addPet(Pet pet) {
        int i = petMapper.addPet(pet);
        return i;
    }

    @Override
    public int deletePet(Integer id) {
        int i = petMapper.deletePet(id);
        return i;
    }

    @Override
    public int updatePet(Pet pet) {
        int i = petMapper.updatePet(pet);
        return i;
    }

    @Override
    public int updateState(Pet pet) {
        int i = petMapper.updateState(pet);
        return i;
    }

    @Override
    public List<Pet> getPets() {
        List<Pet> pets = petMapper.getPets();
        return pets;
    }

    @Override
    public List<Pet> findByState(Integer state) {
        List<Pet> pets = petMapper.findByState(state);
        return pets;
    }

    @Override
    public Pet findById(Integer id) {
        Pet byId = petMapper.findById(id);
        return byId;
    }

    @Override
    public List<Pet> findByPetType(String petType) {
        List<Pet> pets = petMapper.findByPetType(petType);
        return pets;
    }

    @Override
    public void deleteBatch(List<Integer> ids) {
        petMapper.deleteBatch(ids);
    }
}
